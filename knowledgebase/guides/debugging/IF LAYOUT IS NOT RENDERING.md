IF LAYOUT IS NOT RENDERING
(NOTE: the fact that other pages may work with the same include does not guarantee all pages will work
because the working page may use different variables)

add to page's layout

<p>cards_source: {{ page.cards_source }}</p>
<p>variant: {{ page.variant }}</p>

if these render, the problem is not with
- html page
- layout chain
- variable scope

because both variables are passed page-level values for which, to render
must be passed to layout with variable scope intact.

therefore, the only remaining possibility for error resides in include calls with either
- failing data lookup
- failing loop


 failing data lookup
to test failing data lookup add to site-cards.html

<p>cards object: {{ site.data.cards[page.cards_source] | inspect }}</p>

if prints nil or {}
then potential 
- wrong data file name
- wrong key
- wrong nesting
- wrong path
 
if cards object renders
- the data file is correct
- the key tours is correct
- the front matter is correct
- the layout chain is correct
- the include is being called correctly


failing loop

