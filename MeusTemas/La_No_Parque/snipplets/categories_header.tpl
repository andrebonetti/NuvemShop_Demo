{% for item in navigation %}
		{% if item.subitems %}
                {% snipplet "navigation_header.tpl" with navigation = item.subitems %}
        {% endif %}
{% endfor %}    