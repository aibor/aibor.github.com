---
layout: default
title: aiBo - yay.
---
## [Artikel][1] <a href="/articles/atom.xml" title="Feed für Artikel"><img src="/images/feed-small.png" alt="Feed" title="Feed für Artikel"></a>

{% for post in site.categories.articles limit:10 %}
* {{ post.date | date: "%d\.%m\.%Y" }} &mdash; [{{ post.title }}]({{ post.url }})
{% endfor %}{:.postlist}
[Alle Artikel][1] 

[1]: /articles/ "Alle Artikel anzeigen"

---
## [Links][2] <a href="/links/atom.xml" title="Feed für Links"><img src="/images/feed-small.png" alt="Feed" title="Feed für Links"></a>

{% for post in site.categories.links limit:10 %}
* <p>{{ post.content }}</p>
  <p style="margin:0; padding:0; font-size:60%; color:#333;">{{ post.date | date: "%d.%m.%Y" }}</p>
{% endfor %}{:.linklist}
[Alle Links][2]

[2]: /links/ "Alle Links auflisten"
