/* element does not resize using inline */
chrome f12:
The display: inline property prevents width from having an effect.
Try setting display to something other than inline.

wrapper {
	width: 75%; 
	margin-block: 15px; 
	margin-inline: auto; }

RESOLVED
(originally thought 'margin-inline' was cause.)
'wrapper' is a semantic keyword and therefore does not inherit
attributes associated with a div, including 'display: block'.
therefore, it was inheriting 'display: inline', which does not have width attributes.
explicitly setting 'display: block' resized width and centered in parent (body):

wrapper {
	display: block;
	width: 75%; 
	margin-block: 15px; 
	margin-inline: auto; }

https://softwareengineering.stackexchange.com/questions/404472/inline-html-elements-dont-allow-setting-width-why-is-that

/**/

