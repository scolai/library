 GOAL Filter a data file using front‑matter on the home page so only selected tour cards appear.

I want the home page to contain certain tour card thumbnails. I want to use the data file but I want to use front matter in the home page to indicate which cards to use.
        {% for card in site.data.cards %}          
	{% include site/site-cards.html %} 


1. list the desired content in front matter:
---
layout: home
featured_tours:
  - tour_niagara
  - tour_toronto
  - tour_wine
---
These keys will match the keys in the data file. eg tour_niagara is also the key in the data file that begins with -
Also ensure each key in the data file is unique.

2. loop only the selected cards
In the page layout add
{% for key in page.featured_tours %} 
  {% assign card = site.data.cards[key] %}
  {% include site/site-cards.html card=card variant="tours_home" %}
{% endfor %}

{% for key in page.featured_tours %}
identifies which cards you want and list them in front matter

{% assign card = site.data.cards[key] %}
connects them to the corresponding data objects which are in data/cards

{% include site/site-cards.html card=card variant="tours_home" %}
passes the objects to the correct variant in site-card

where the for loop introduces the list to loop through (everything in front matter featured_tours) wherein a variable (key) is passed the values of the front matter (featured_tours)
then creates a variable (card) that is passed the values of the front matter (featured_tours) via key



