Inside of jindex, it would be better to scrap the "path" thing and just have folders sitting at the top.

{% raw %}
```liquid
{% assign folders = "" %}
{% for file in site.static_files %}
  {% assign filefolder = file.path | remove: file.name %}
  {% folders = folders | append: "" | append: filefolder %}
{% endfor %}
{% folders = folders | join: " " %}
{% for folder in folders %}
  <a href="{{ folder | relative_url }}">
   {{ folder }}
  </a>
{% endfor %}
```
{% endraw %}
