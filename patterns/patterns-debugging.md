# How to tame the spaghetti monster
## Name the voice: you already did — calling it “the spaghetti monster” makes it external, not your identity.
## Flip the script: instead of “faster,” ask “clearer.” Every time you feel the rush, pause and print ({{ site.data | jsonify }}) or sketch the directory tree.
## Codify conventions: once you lock in naming and layout rules, you don’t have to re‑decide them under pressure.
## Debug in small bites: drop <p>TEST CONTENT</p> or {{ card.title }} in isolation. If it renders, you know the pipeline is alive.

## A good way to accelerate your learning curve is to treat each debugging session like a mini‑experiment:
## Hypothesis: “This loop isn’t rendering because the data path is wrong.”
## Test: Drop a {{ site.data | jsonify }}.
## Result: Confirm the structure.
## Lesson: Document the fix in your notes so you don’t have to rediscover it later.


#
{% for card in site.data.tour_cards.tour_card %}
	<pre>{{ site.data.tour_cards | jsonify }}</pre>

	<p>{{ card | inspect }}</p>
			
{% endfor %}