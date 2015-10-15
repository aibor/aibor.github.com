---
title: aiBo - Notizblog - Artikel
---
{% for post in site.categories.articles %}
{% include bymonth.md %}

[{{ post.title }}]({{ post.url }})
{:.with_timestamp}

{% if post.tags == empty %}
{{ post.date | date: "%d.%m.%Y" }}
{% else %}
{{ post.date | date: "%d.%m.%Y" }}  —  {{ post.tags | join " " }}
{% endif %}{:.timestamp}

{% endfor %}
