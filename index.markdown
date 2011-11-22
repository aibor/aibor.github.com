---
layout: default
title: Hello World!
---
## Willkommen!

### Bisherige Einträge:

{% for post in site.posts %}
* [{{ post.title }}]({{ post.url }})
<span class="date">Erstellt: {{ post.date | date_to_string }}</span>
<span class="tags">Tags: {{ post.tags | join ", " }}</span>
{:.postlist}
{% endfor %}
