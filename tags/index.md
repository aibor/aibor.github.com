---
title: aiBo - Notizblog - Tags
---
{% include sorted-tags.md %}

{% for tag in sorted-tags %}
### {{ tag }}

{% for post in site.tags[tag] %}

{% if post.categories contains 'links' %}
[{{ post.title | escape_once | replace: '|', '&#124;' }}]({{ post.linkurl }})
{:.with_timestamp}
{% else %}
[{{ post.title }}]({{ post.url }})
{:.with_timestamp}
{% endif %}

{% if post.tags == empty %}
{{ post.date | date: "%d.%m.%Y" }}
{% else %}
{{ post.date | date: "%d.%m.%Y" }}  —
{%- for tag in post.tags %}
  [{{ tag }}](/tags/#{{ tag }})
{%- endfor %}
{% endif %}{:.timestamp}

{% endfor %}
{% endfor %}
