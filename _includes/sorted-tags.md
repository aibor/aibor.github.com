{% capture tags %}
  {% for tag in site.tags %}
    {{ tag[0] }}
  {% endfor %}
{% endcapture %}

{% assign sorted-tags = tags | split:' ' | sort %}
