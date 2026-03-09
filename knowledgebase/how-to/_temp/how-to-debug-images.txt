Images path:

Front matter → calling include (site-boss.html / tours loop) → values passed → responsive-picture.html assigns them → builds <picture> + srcset.	


TROUBLESHOOTING
Front matter → loop/include call → parameters passed → responsive-picture.html assigns → final <picture> + srcset.

Once you see it as a chain, it’s easier to debug:

If values aren’t reaching the browser, check the include call.

If they’re reaching but not rendering, check the assigns + markup in responsive-picture.html.

If the markup is fine but images vanish, check the srcset/sizes pairing.

You’ve now got the mental model nailed down — everything flows cleanly from front matter into the partial.


404 IMAGE NOT LOADING - 
/localhost:4000/images/home/-800.jpg

The built site is serving from a different root (e.g. /images/... instead of /images/home/...).

Or the include is missing a leading slash, so the URL resolves relative to the current page.

Or Jekyll didn’t copy those files into _site/images/home/.

If all checks out make sure the variables of the include are passed explicitly in higher includes

Inspect the actual srcset attribute in DevTools.

Confirm each width in widths has a real file on disk and a correct URL in srcset.

If some candidates are missing, the browser falls back to the largest one present (1920), which 404s if not generated.


IMAGE HEIGHT EXCEEDING CONTAINER HEIGHT
img {
      display: block;
      height: auto;
	  max-height: 100%;
	  width: 100vw;
      max-inline-size: 100%;
      object-fit: cover;
	  object-position: top;}

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