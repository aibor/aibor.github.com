---
layout: default
title: aiBo - Notizblog - Links
monthnames: [Januar, Februar, März, April, Mai, Juni, Juli, August, September, Oktober, November, Dezember]
---
{% for post in site.categories.links %}
{% capture pyear %}{{ post.date | date: "%Y" }}{% endcapture %}
{% capture pmonth %}{{ post.date | date: "%m" }}{% endcapture %}
{% if gyear == NULL or gyear > pyear %}
  {% assign gyear = pyear %}
  <h2>{{ gyear }}</h2>
{% endif %}
{% if gmonth == NULL or gmonth != pmonth %}
  {% assign gmonth = pmonth %}
  {% for monthname in page.monthnames %}
    {% if forloop.index < 10 %}
      {% capture floop %}0{{ forloop.index }}{% endcapture %}
    {% else %}
      {% capture floop %}{{ forloop.index }}{% endcapture %}
    {% endif %}
    {% if pmonth == floop %}
  <h3>{{ monthname }}</h3>
    {% endif %}
  {% endfor %}
{% endif %}
<p style="margin-bottom:0; padding-bottom:0;">{{ post.content }}</p>
<p style="margin:0; padding:0; font-size:60%; color:#333;">{{ post.date | date: "%d.%m.%Y" }}</p>
{% endfor %}
