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
## {{ gyear }}
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
### {{ monthname }}
      {% endif %}
    {% endfor %}
  {% endif %}

  {{ post.content }}{:.with_timestamp}

  {% if post.tags == empty %}
  {{ post.date | date: "%d.%m.%Y" }}
  {% else %}
  {{ post.date | date: "%d.%m.%Y" }}  —  {{ post.tags | join " " }}
  {% endif %}{:.timestamp}

{% endfor %}
