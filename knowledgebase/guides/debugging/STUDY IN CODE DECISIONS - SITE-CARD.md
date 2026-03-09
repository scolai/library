STUDY IN CODE DECISIONS - SITE-CARDS


{% assign source = page.cards_source %}
{% assign filter = page.filter %}
{% assign variant = page.variant %}
{% assign cards = site.data.cards[source] %}

{% if filter %}
  {% assign keys = cards | where_exp: "item", "item[1].type == filter" | map: 0 %}
{% else %}
  {% assign keys = cards | keys %}
{% endif %}

{% for key in keys %}
  {% assign card = cards[key] %}
    {% include site/site-card.html card=card variant=variant %}
{% endfor %}


{% assign source  = page.cards_source %}
{% assign filter  = page.filter %}
{% assign variant = page.variant %}
{% assign cards   = site.data.cards[source] %}

{% if filter %}
  {%- assign keys = filter -%}   <!-- filter is already an array of keys -->
{% else %}
  {%- assign keys = cards | keys -%} <!-- fallback: all keys from the hash -->
{% endif %}

{% for key in keys %}
  {% assign card = cards[key] %}
  {% include site/site-card.html card=card variant=variant %}
{% endfor %}

niagara_light_festival{"type"=>"tour", "name"=>"Niagara Light Festival", "thumbnail"=>{"path"=>"/images/tours", "base"=> etc
niagara_light_festival{"type"=>"tour", "name"=>"Niagara Light Festival", "thumbnail"=>{"path"=>"/images/tours", "base"=>