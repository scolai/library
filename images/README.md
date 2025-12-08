KNOWLEDGEBASE
devtools shows no problems, but URI not rendering:
example:
	.input-button img {
		position: relative;
		z-index: 999;
		height: 1.5rem;
		width: 1.5rem;
		line-height: 2.78;
		color: var(--gray-lightest);
		mask-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 20 20'%3E%3Cpath fill='currentColor'polygon points='16.172 9 10.101 2.929 11.515 1.515 20 10 19.293 10.707 11.515 18.485 10.101 17.071 16.172 11 0 11 0 9'/%3E%3C/svg%3E");
		background-position: center;
		background-size: contain;
		background-repeat: no-repeat; }

ISSUE: 
example URI uses polygon, not path. polygon uses "points" in place of "path". tried to force "path fill..." but invalid syntax, breaking the code.
SOLUTION:
use polygon in place of path: <polygon fill='currentColor' points='...'...>


/* allow css color - add to URI
<path fill="currentColor" ... />



***


creative-commons-remix

mask-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 20 20'%3E%3Cpath d='M8.8,10.8l1.1,0.6c-0.2,0.4-0.6,0.8-1,1.1c-0.4,0.3-0.9,0.4-1.4,0.4c-0.8,0-1.5-0.2-2-0.8C5,11.6,4.8,10.9,4.8,10c0-0.9,0.3-1.6,0.8-2.1C6,7.4,6.7,7.1,7.5,7.1c1.1,0,2,0.4,2.4,1.3L8.7,9.1C8.5,8.8,8.4,8.6,8.2,8.5S7.8,8.4,7.7,8.4c-0.8,0-1.2,0.5-1.2,1.6c0,0.5,0.1,0.9,0.3,1.2c0.2,0.3,0.5,0.4,0.9,0.4C8.2,11.6,8.6,11.4,8.8,10.8z'/%3E%3C/svg%3E"); 




mask-image: url("data:image/svg+xml,%3Csvg version='1.1' id='Creative\_Commons\_Remix' xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink' x='0px' y='0px' viewBox='0 0 20 20' enable-background='new 0 0 20 20' xml:space='preserve'%3E%3Cpath d='M16.8,3.2C15,1.3,12.7,0.4,10,0.4c-2.7,0-4.9,0.9-6.8,2.8C1.3,5.1,0.4,7.4,0.4,10c0,2.6,0.9,4.9,2.8,6.8 c1.9,1.9,4.1,2.8,6.8,2.8c2.6,0,4.9-1,6.9-2.9c1.8-1.8,2.7-4.1,2.7-6.7C19.6,7.3,18.7,5,16.8,3.2z M15.6,15.5 c-1.6,1.6-3.5,2.4-5.6,2.4c-2.1,0-4-0.8-5.6-2.3C2.9,14,2.1,12.1,2.1,10c0-2.1,0.8-4,2.4-5.6C6,2.9,7.8,2.1,10,2.1 c2.2,0,4,0.8,5.6,2.3c1.5,1.5,2.3,3.4,2.3,5.6C17.9,12.2,17.1,14,15.6,15.5z M16.3,10.2l-1.9-0.8V7L8.5,4.6L5.9,5.7v2.7l0,0l-2.3,1 v2.5l2.5,1.1l2.5-1L8.7,12l5,2.1l0.1,0l0.1,0l2.3-1l0.2-0.1v-2.7L16.3,10.2z M13.6,13.3L13.6,13.3L13.6,13.3l-4.4-1.8V9.8l4.4,1.8 v0.1l0,0V13.3z M13.8,11.1l-1.4-0.6L14,9.9l1.4,0.6L13.8,11.1z M15.9,12.6l-1.7,0.7v-1.7l1.7-0.7V12.6z' data-index='0' style='opacity: 1; visibility: visible;'%3E%3C/path%3E%3C/svg%3E");



chevron-right

mask-image: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"><path d="M12.95 10.707l.707-.707L8 4.343 6.586 5.757 10.828 10l-4.242 4.243L8 15.657l4.95-4.95z"/></svg>');



checkmark-outline

mask-image: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"><path d="M2.93 17.07A10 10 0 1 1 17.07 2.93 10 10 0 0 1 2.93 17.07zm12.73-1.41A8 8 0 1 0 4.34 4.34a8 8 0 0 0 11.32 11.32zM6.7 9.29L9 11.6l4.3-4.3 1.4 1.42L9 14.4l-3.7-3.7 1.4-1.42z"/></svg>');




arrow-right


<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"><polygon points="16.172 9 10.101 2.929 11.515 1.515 20 10 19.293 10.707 11.515 18.485 10.101 17.071 16.172 11 0 11 0 9"></polygon></svg>

url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"><polygon points="16.172 9 10.101 2.929 11.515 1.515 20 10 19.293 10.707 11.515 18.485 10.101 17.071 16.172 11 0 11 0 9"/></svg>')
