---
layout: default
title: aiBo - Notizblog
---
## [Artikel][1] [![Feed][3]][2]

{% for post in site.categories.articles limit:10 %}
* {{ post.date | date: "%d\.%m\.%Y" }} &mdash; [{{ post.title }}]({{ post.url }})
{% endfor %}{:.postlist}
[Alle Artikel][1] 

[1]: /articles/ "Alle Artikel anzeigen"
[2]: /articles/atom.xml "Feed f&uml;r Artikel"
[3]: /images/feed-small.png

---

## [Links][4] [![Feed][6]][5]

<ul class="linklist">
{% for post in site.categories.links limit:10 %}
<li>
<p>
  {{ post.content }}
</p>
<p style="margin:0; padding:0; font-size:60%; color:#333;">
  {{ post.date | date: "%d.%m.%Y" }}
</p>
</li>
{% endfor %}
</ul>
[Alle Links][4]

[4]: /links/ "Alle Links auflisten"
[5]: /links/atom.xml "Feed f&uml;r Links"
[6]: /images/feed-small.png
