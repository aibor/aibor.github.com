---
title: aiBo - Notizblog
---

## [Links][4]

{% for post in site.categories.links limit:20 %}
* [{{ post.title | escape_once | replace: '|', '&#124;' }}]({{ post.linkurl }})
  {% if post.tags == empty %}
  {{ post.date | date: "%d.%m.%Y" }}
  {% else %}
  {{ post.date | date: "%d.%m.%Y" }}  —
  {%- for tag in post.tags %}
    [{{ tag }}](/tags/#{{ tag }})
  {%- endfor %}
  {% endif %}{:.timestamp}
{% endfor %}{:.linklist}

[Alle Links][4]

[4]: /links/ "Alle Links auflisten"

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
