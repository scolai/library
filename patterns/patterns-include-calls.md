### CALLING RESPONSIVE-PICTURE
{% include utilities/responsive-picture.html path=page.media1_path base=page.media1_base alt=page.media1_alt has_avif=true has_webp=false %}

# include for populating page
# source: data file array
# images
{% if page.url %}


# goes into default layout
	<!-- optional extras -->
	 {% include head.html %}
	 {{ content_for_head }}
 
 # goes into layout
  {% if page.content_for_head %}
	  {% include {{ page.content_for_head }} %}
	{% else %}
	  {% capture content_for_head %}
		  {% include posts/post-head.html %}
	  {% endcapture %}
	  {{ content_for_head }}
	{% endif %}



### TWO METHODS FOR USING FOR LOOP TO POPULATE PAGE WITH INCLUDES ###

# assign front matter variable to data file values
# then loop data file contents to populate page
{% assign layout_includes = site.data.layouts.tour_page %}
{% for inc in layout_includes %}
	{% include {{ inc }}.html %}
{% endfor %}


# populates the html page drawing from a list of 'sections' items in front matter
# each 'sections' item is stripped of white space and adjoined to an include.
# looped list of includes 
# These examples go inside the page layout
# NOTE: the hybrid method does not allow layout to contain separate html. all html must be contained in includes.
<article>
  <!-- Inline content: headings & paragraphs -->
  {{ content }}

  <!-- Modular content: pulled from includes -->
  {% if page.sections %} # if page contains "sections" keyword then next
    {% assign section_list = page.sections | split: "," %} #  loop through its items
    {% for section in section_list %}
      {% include {{ section | strip }}.html %} # strip the sections item of white space and append to .html extension to complete the include.
    {% endfor %}
  {% endif %}
</article>
front matter:
sections: "header,title,image,footer"

# can use this process to mix and match endless combinations of include calls combined with {{ content }}. For example
# this combines multiple front matter keywords - top_sections, bottom_sections - with content in between. This could also 
# be combined with single include calls for more variation.
<article>
  {% if page.top_sections %}
    {% assign top_list = page.top_sections | split: "," %}
    {% for section in top_list %}
      {% include {{ section | strip }}.html %}
    {% endfor %}
  {% endif %}

  {{ content }}

  {% if page.bottom_sections %}
    {% assign bottom_list = page.bottom_sections | split: "," %}
    {% for section in bottom_list %}
      {% include {{ section | strip }}.html %}
    {% endfor %}
  {% endif %}
</article>

