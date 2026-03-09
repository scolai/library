Absolutely — this is a classic layout problem, and the fix depends on **which part** you want to stretch:

- the **card itself**  
- the **content inside the card**  
- the **footer/author area**  
- or all of the above  

But the underlying principle is always the same:

# 🟩 Use **flexbox** on the card and let the content grow

Here’s the reliable, modern pattern that works in every browser and every grid system.

---

# 🟦 1. Make each card a flex container


.testimonial {
  display: flex;
  flex-direction: column;
  height: 100%;
}


This tells the card:

- stack children vertically  
- stretch to full height  
- allow inner content to grow  

---

# 🟦 2. Allow the text block to expand and fill available space


.testimonial__text {
  flex-grow: 1;
}


This is the magic line.

It means:

- “take up all remaining vertical space”
- “push the author/footer to the bottom”
- “equalize card heights even if text lengths differ”

---

# 🟦 3. Keep the author/footer pinned to the bottom


.testimonial__author {
  margin-top: auto;
}


This ensures:

- short testimonials don’t leave the author floating halfway up  
- long testimonials don’t push the author off the card  
- all cards align visually  

---

# 🟦 4. Example HTML structure (matches your Jekyll loop)

html
<div class="testimonial">
  <div class="testimonial__text">
    {{ t.text | markdownify }}
  </div>

  <p class="testimonial__author">- {{ t.author }}</p>
</div>


This structure + flexbox = perfect equal-height cards.

---

# 🟦 5. If you’re using a grid (CSS Grid or Flexbox)

Make sure the grid doesn’t interfere:


.grid-testimonials {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
  gap: 2rem;
}


Or Flexbox:


.grid-testimonials {
  display: flex;
  flex-wrap: wrap;
  gap: 2rem;
}

.testimonial {
  flex: 1 1 300px;
}


Both work with the flexbox card pattern.

---

# 🟩 Final combined CSS (copy/paste ready)


.grid-testimonials {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
  gap: 2rem;
}

.testimonial {
  display: flex;
  flex-direction: column;
  height: 100%;
  padding: 1.5rem;
  background: #fff;
  border-radius: 12px;
  box-shadow: 0 4px 12px rgba(0,0,0,0.08);
}

.testimonial__text {
  flex-grow: 1;
}

.testimonial__text p {
  margin-bottom: 1rem;
  line-height: 1.7;
}

.testimonial__author {
  margin-top: auto;
  font-weight: bold;
  opacity: 0.7;
}


---

# 🟩 Result

- All cards become equal height  
- Long testimonials expand naturally  
- Short testimonials stretch to match  
- Author/footer always sits at the bottom  
- Layout stays clean and balanced  

---

If you want, I can help you:

- add responsive breakpoints  
- add a “read more” expander for very long testimonials  
- add subtle hover effects  
- match the style to your brand’s OG image aesthetic  

Would that be best at this time?