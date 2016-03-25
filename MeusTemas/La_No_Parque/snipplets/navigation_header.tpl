{% for item in navigation %}
    <a href="{{ item.url }}" {% if item.url | is_external %}target="_blank"{% endif %}>{{ item.name }}</a>
{% endfor %}