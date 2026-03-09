jekyll notes
**

setup
jekyll new <sitename>
bundle exec jekyll serve OR jekyll build

parts of a jekyll website:
- layouts/layout templates
layouts contain frontmatter, identifying the types of layout(s) the final page will render.  if a page does not contain frontmatter it is a "true" html document and jekyll tags will not work in it.
layouts contain includes.

- includes
includes are also called snippets.  they typically are reuseable parts of webpages - header, footers, asides, sets of icons or links, etc.  they are inserted into layouts.
includes may be inserted into other includes.  however, perhaps standalone includes may be the best method (where no includes are contained in other includes) to provide easier versatility. at least until best methods are learned for how and when to combine includes.

- pages/page templates
A page (or static page) is any html document that does not contain frontmatter.  jekyll tags will not be processed. 

- posts/post-type files
Posts may be similar to what semantic html calls articles. examples include blog posts and product descriptions.  Posts like product descriptions are organized according to attributes into collections.

LOGIC AND FLOW CONTROL
https://jekyllrb.com/docs/liquid/tags/
{% %}

{% if page.show_sidebar %}
	# add markup and content
	<sidebar>
		<content>
	</sidebar>
  <{% endif %}

LINK TO A PAGE FROM MARKDOWN
https://jekyllrb.com/docs/liquid/tags/
[Link to a page]({% path/to/index.html %})

Check  out the [Jekyll docs][jekyll-docs] for more info 
[jekyll-docs]: https://path/to/doc.html

LINK TO A PAGE USING A VARIABLE
# in front matter
my_variable: news/index.html  

# in page
{% link {{ page.my_variable }} %}
# enclose in parentheses to turn into link 
[Anchor text] ({% link {{ page.my_variable }} %})

CUSTOM FRONT MATTER
 Any custom front matter that you specify will be available under page. For example, if you specify custom_css: true in a page’s front matter, that value will be available as page.custom_css.

If you specify front matter in a layout, access that via layout. For example, if you specify class: full_page in a layout’s front matter, that value will be available as layout.class in the layout and its parents. 

FIND PATH OF A PAGE
add {{ page.path }} to page


CHANGE OUTPUT OF LIQUID OBJECT USING FILTERS
{{ "scott" | capitalize }}
Scott

Use in a Liquid document within the html
---
# indicates liquid document
---
<html>
	<h1>{{ "scott laing" | capitalize }}</h1>
</html>
> Scott Laing

SET PAGE CANONICAL
search>jekyll using site.url page.url for canonical
<link rel="canonical" href="{{ page.url | absolute_url }}">

OVERRIDE PAGE CANONICAL WITH CUSTOM CANONICAL
   ---
   layout: post
   title: My Post
   canonical_url: https://example.com/my-custom-canonical-url/
   ---
   {% if page.canonical_url %}
     <link rel="canonical" href="{{ page.canonical_url }}">
   {% else %}
     <link rel="canonical" href="{{ page.url | absolute_url }}">
   {% endif %}
