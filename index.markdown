---
layout: default
title: aiBo - yay.
---
## Artikel:

{% for post in site.categories.articles limit:10 %}
* {{ post.date | date_to_string }} &mdash; [{{ post.title }}]({{ post.url }})
{% endfor %}{:.postlist}

---
## Links:

{% for post in site.categories.links limit:10 %}
* {{ post.content }}
  <p style="margin:0; padding:0; font-size:60%; color:#333;">{{ post.date | date_to_long_string }}</p>
{% endfor %}{:.linklist}
[Alle Links](/links/ "Alle Links auflisten")
