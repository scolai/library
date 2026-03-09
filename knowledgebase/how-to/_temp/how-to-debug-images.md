Images path:



Front matter → calling include (site-boss.html / tours loop) → values passed → responsive-picture.html assigns them → builds <picture> + srcset.	





**TROUBLESHOOTING**

**Front matter → loop/include call → parameters passed → responsive-picture.html assigns → final <picture> + srcset.**



Once you see it as a chain, it’s easier to debug:



If values aren’t reaching the browser, check the include call.



If they’re reaching but not rendering, check the assigns + markup in responsive-picture.html.



If the markup is fine but images vanish, check the srcset/sizes pairing.



You’ve now got the mental model nailed down — everything flows cleanly from front matter into the partial.





404 IMAGE NOT LOADING - 

/localhost:4000/images/home/-800.jpg



The built site is serving from a different root (e.g. /images/... instead of /images/home/...).



Or the include is missing a leading slash, so the URL resolves relative to the current page.



Or Jekyll didn’t copy those files into \_site/images/home/.



If all checks out make sure the variables of the include are passed explicitly in higher includes



Inspect the actual srcset attribute in DevTools.



Confirm each width in widths has a real file on disk and a correct URL in srcset.



If some candidates are missing, the browser falls back to the largest one present (1920), which 404s if not generated.





IMAGE HEIGHT EXCEEDING CONTAINER HEIGHT

img {

&nbsp;     display: block;

&nbsp;     height: auto;

&nbsp;	  max-height: 100%;

&nbsp;	  width: 100vw;

&nbsp;     max-inline-size: 100%;

&nbsp;     object-fit: cover;

&nbsp;	  object-position: top;}



100vw forces image to expand with width. Depending on its actual dimension 

this expansion may require the height to grow proportionally, so as the image

grows wider it also grows taller and breaks the height of the container.



Simplist fix is to use images with widths which don't require stretching and explicitly set image height.





IMAGE DISAPPEARS AT A BREAKPOINT THAT IS NOT HARDCODED IN CSS

Possible reasons:

No matching candidate in srcset 

At a given viewport width, the browser calculates the slot size from sizes. If there’s no srcset image that can satisfy that slot, some browsers will fail to render anything.



Empty or mismatched sizes rules

If sizes tells the browser “this image is 1200px wide” but your srcset only goes up to 1000w, the browser may skip rendering.



Source order in <picture> 

If you’re using <source> elements for AVIF/WebP and they don’t cover all breakpoints, the fallback <img> might not be triggered correctly.



CSS container quirks 

If the container collapses to 0px height at a certain width (e.g. flexbox shrink, grid auto‑rows), the image is technically there but invisible.





IMAGE IS BEING CROPPED THOUGH IS WIDE ENOUGH NOT TO

For boss images I am using images wide enough to not require stretching. However, the browser still magnifies the image so the full height is not viewable. 

display: block; 

height: 250px; 

width: 100vw; 

max-inline-size: 100%; 

object-fit: cover;



guarantees cropping:

height: 250px;

object-fit: cover;

object-fit: cover tells the browser:

Because the image is wider than the box it must be zoomed in to fill the box.

And height 250px shortens the image forcing a fixed height ignoring the natural aspect ratio.

“Fill the box completely, even if you must zoom in and crop.”

And since you’ve also fixed the height to 250px, the browser has no choice but to scale the image until it fills a 100vw × 250px rectangle.

Even if your image is huge, the browser will still zoom until the shorter dimension fits the box.



