HOW TO OVERLAY TEXT ON IMAGE WITH TINT
overlay {
	color: #fff;
	text-shadow: 0.1em 0.1em 2em #000;
	font-size: 2.75rem;
	margin-block: 0;
	font-family: sans-serif;
	background-color: hsla(212, 33%, 89%, 0.5);
	padding-inline: 15px;
	padding-block: 30px;
	text-align: center;  }

HOW TO OVERLAY DURING MOUSEOVER
	margin-block: 0;
	background-color: hsla(212, 33%, 89%, 0.5);


/* WARN: COPY-MODE*/
https://github.com/microsoft/wslg/issues/972
run wsl --shutdown from powershell/cmd. Then open wsl again.

HOW TO MAKE BORDERS APPEAR LESS THAN 1px
set opacity to less than 1
border: 1px solid hsla(212, 22%, 82%, 0.2);


HOW TO DELAY TRANFORMATION 
transition-duration: 0.2s;

HOW TO ADD TINT OVERLAY ON IMAGE



HOW TO MAKE TEXT OVERLAY ON IMAGE
position: relative (container)
position: absolute 
top
left


HOW TO MAKE A FLOATING INPUT LABEL
https://codepen.io/yavuzselim/pen/QWEzXpj

HOW TO ALIGN COLUMNS
flex-direction: row;

FLOAT IMAGE
vertical repeat not cleared by clear: all
>background-size: cover
space around floated image
>add margins to image or image-container tag


REMOVE INPUT FOCUS BORDER
outline: 0;

OUTLINE TEXT
https://fluentsupport.com/how-to-create-outline-text-in-css/
  -webkit-text-stroke: 1px darkgreen;

FLIP HORIZONTAL ORDER (EG CARDS)
flex order

HOW TO ADD VIDEO TO PAGE
<video width="400" controls>
  <source src="mov_bbb.mp4" type="video/mp4">
  <source src="mov_bbb.ogg" type="video/ogg">
  Your browser does not support HTML video.
</video>

HOW TO INDENT WRAPPED TEXT
https://developer.mozilla.org/en-US/docs/Web/CSS/text-indent
text-indent: <value> hanging;

HOW TO BOXSHADOW WITHOUT END BORDERS
https://www.geeksforgeeks.org/css/css-box-shadow-bottom-only/
box-shadow: h-shadow v-shadow blur spread color inset:
box-shadow: 0 4px 2px -2px rgba(0, 0, 0, 0.2);
-2px spread

HOW TO TOP ALIGN GRID COLUMNS
> * + * { ... } X
padding-block: *px;