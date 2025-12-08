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

# assign front matter variable to data file values
# then loop data file contents to populate page
{% assign layout_includes = site.data.layouts.tour_page %}
{% for inc in layout_includes %}
	{% include {{ inc }}.html %}
{% endfor %}