{% for category in categories %}
    <li data-theme="{{ theme | default('c') }}"><a href="{{ category.url }}">{{ category.name }}</a></li>
    {% if category.subcategories %}
        {% snipplet "categories.tpl" with categories = category.subcategories, theme = theme %}
    {% endif %}
{% endfor %}
