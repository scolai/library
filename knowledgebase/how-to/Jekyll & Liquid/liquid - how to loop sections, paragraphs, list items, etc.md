# how to loop sections, paragraphs, list items, etc using front matter for-loops

section_name:
  - info: "First paragraph text."
  - info: "Second paragraph text."
  - info: "Third paragraph text."


{% for block in page.section_name %}
  <p>{{ block.info }}</p>
{% endfor %}


without html tags:
{% for block in page.section_name %}
{{ block.info }}

{% endfor %}
wrapped in markdown


section_name:
  - info: |
      First paragraph.

      Second paragraph.

      Third paragraph.

{{ block.info | markdownify }}

# a simple loop involving front matter

tour_faq:
  - faq: null
    question: ※1.
      オンタリオ州の規定により、ワイナリーでの試飲は19歳以上のお客様のみとなります。19才未満の方はワインの試飲はできませんが、ご返金はありません。
    answer: ※2.
      オンタリオ州の規定により、ワイナリーでの試飲は19歳以上のお客様のみとなります。19才未満の方はワインの試飲はできませんが、ご返金はありません。
  - faq: null
    question: ※1.
      オンタリオ州の規定により、ワイナリーでの試飲は19歳以上のお客様のみとなります。19才未満の方はワインの試飲はできませんが、ご返金はありません。
    answer: ※2.
      オンタリオ州の規定により

  <div class="tour-faq">
	<h2 class="tour-faq__title">ご注意ください</h2>				
	<dl class="tour-faq__list">
		{% for faq in page.tour_faq %}
		<div class="tour-faq__faq">
			<dt class="tour-faq__question">{{ faq.question }}</dt>
			<dd class="tour-faq__answer">{{ faq.answer }}</dd>
		</div>
		{% endfor %}
	</dl>
</div>