.card {
  /* 1. Set the parent container to position: relative */
  position: relative; 
  padding: 20px;
  border: 1px solid #ccc;
  /* Add other styles like background, margin, etc. */
}

.card-link {
  /* 2. Extend the link's clickable area using a pseudo-element */
  position: static; /* Ensure the link itself remains in flow */
}

.card-link::after {
  content: '';
  position: absolute;
  /* 3. Position the pseudo-element to cover the entire parent */
  inset: 0; /* A shorthand for top: 0; bottom: 0; left: 0; right: 0; */
  display: block;
  z-index: 1; /* Ensure the link is above other content */
}

/* Optional: Add hover effect to the entire card */
.card:hover {
  background-color: #f0f0f0;
  cursor: pointer;
}
