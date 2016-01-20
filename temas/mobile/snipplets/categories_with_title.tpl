{% for category in categories %}
    {% if category.subcategories %}
        <li data-role="list-divider">{{ category.name }}</li>
        {% snipplet "categories.tpl" with categories = category.subcategories %}
    {% else %}
        <li data-theme="b"><a href="{{ category.name }}">{{ category.name }}</a></li>
    {% endif %}
{% endfor %}
