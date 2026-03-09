STUDY IN CODE DECISIONS


{% if page.testimonials %}
{% for card in site.data.cards.testimonials %}
  {% include site/site-card.html card=card variant="testimonials" %}
 {% endfor %}

{% elsif page.small_tour_card %}
{% for card in site.data.cards.tours %}
  {% include site/site-card.html card=card variant="small_tour_card" %}
{% endfor %}

{% elsif page.large_tour_card %}
{% for card in site.data.cards.tours %}
  {% include site/site-card.html card=card variant="large_tour_card" %}
{% endfor %}

{% else page.blogs %}
{% for card in site.data.cards.blogs %}
  {% include site/site-card.html card=card variant="blog" %}
{% endfor %}
{% endif %}

 =>

{% for key in page.featured_tours %} 
    {% assign card = site.data.cards[key] %}
    {% include site/site-cards.html card=card variant="large_tour_card" %}
{% endfor %}

=>

{% assign source = page.cards_source %}
{% assign filter = page.filter %}
{% assign variant = page.variant %}
{% assign cards = site.data.cards[source] %}

{% if filter %}
  {% for key in filter %}
    {% assign card = cards[key] %}
      {% include site/site-card.html card=card variant=variant %}
  {% endfor %}
{% else %}
  {% for key in cards %}
    {% assign card = cards[key] %}
      {% include site/site-card.html card=card variant=variant %}
{% endif %}

=>

site-card

{% if include.card.type == "tour" and include.variant == "large_tour_card" %}
<a href="{{ include.card.link }}" class="card-wrapper">
<div class="card">								
    <div class="card__media">
        <picture class="card__thumbnail-wrapper">
            {% if page.thumbnail %}
                {% include site/site-thumbnail.html 
                path=page.thumbnail.path 
                base=page.thumbnail.base 
                alt=page.thumbnail.alt 
                caption=page.thumbnail.caption 
                fetch_priority=page.thumbnail.fetch_priority %}		
            {% endif %}
        </picture>
        {% if page.thumbnail.overlay %}
        <span class="card__thumbnail-overlay"><p class="overlay-text">{{ page.thumbnail.overlay }}</p></span>
        {% endif %}
    </div>
    <div class="card__info">
        <h2 class="card__title">{{ page.card.title }}</h2>
        <div class="card__excerpt">
            {% for item in include.card.excerpt %}
                <p class="card__excerpts"></p>
            {% endfor %}
        </div>
        <div class="card__cta">もっと詳しく知る...</div>
    </div>
</div>
</a>
{% endif %}

=>

{% if include.card.type == "tour" and include.variant == "large_tour_card" %}
<a href="{{ include.card.link }}" class="card-wrapper">
<div class="card">								
    <div class="card__media">
        <picture class="card__thumbnail-wrapper">
            {% if card.thumbnail %}
                {% include site/site-thumbnail.html 
                path=include.card.thumbnail.path 
                base=include.card.thumbnail.base 
                alt=include.card.thumbnail.alt 
                caption=include.card.thumbnail.caption
                fetch_priority=include.card.thumbnail.fetch_priority %}		
            {% endif %}
        </picture>
        {% if card.overlay %}
        <span class="card__thumbnail-overlay"><p class="overlay-text">{{ include.card.thumbnail.overlay }}</p></span>
        {% endif %}
    </div>
    <div class="card__info">
        <h2 class="card__title">{{include.card.title }}</h2>
        <div class="card__excerpt">
            {% for item in include.card.excerpt %}
                <p class="card__excerpts">{{ item }}</p>
            {% endfor %}
        </div>
        <div class="card__cta">もっと詳しく知る...</div>
    </div>
</div>
</a>
{% endif %}

