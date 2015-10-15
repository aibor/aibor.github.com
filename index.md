---
title: aiBo - Notizblog
---
## [Artikel][1] [![Feed][3]][2]

{% for post in site.categories.articles limit:5 %}
* [{{ post.title }}]({{ post.url }})
  {:.with_timestamp}
  {% if post.tags == empty %}
  {{ post.date | date: "%d.%m.%Y" }}
  {% else %}
  {{ post.date | date: "%d.%m.%Y" }}  —  {{ post.tags | join " " }}
  {% endif %}{:.timestamp}
{% endfor %}{:.linklist}

[Alle Artikel][1] 

[1]: /articles/ "Alle Artikel anzeigen"
[2]: /articles/atom.xml "Feed f&uuml;r Artikel"
[3]: /images/feed-small.png

---

## [Links][4] [![Feed][6]][5]

{% for post in site.categories.links limit:10 %}
* {{ post.content }}
  {% if post.tags == empty %}
  {{ post.date | date: "%d.%m.%Y" }}
  {% else %}
  {{ post.date | date: "%d.%m.%Y" }}  —  {{ post.tags | join " " }}
  {% endif %}{:.timestamp}
{% endfor %}{:.linklist}

[Alle Links][4]

[4]: /links/ "Alle Links auflisten"
[5]: /links/atom.xml "Feed f&uuml;r Links"
[6]: /images/feed-small.png

---

## [Tags][7]

{% include sorted-tags.md %}

{% capture taglist %}
{% for tag in sorted-tags %}
[{{ tag }}](/tags/#{{ tag }})
{% endfor %}
{% endcapture  %}

{{ taglist | split:" " | join:" — " }}

[7]: /tags/ "Alle Posts mit Tags auflisten"
