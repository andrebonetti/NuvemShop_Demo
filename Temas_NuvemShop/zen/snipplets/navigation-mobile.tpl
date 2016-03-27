{% for item in navigation %}
    {% if item.subitems %}
        <option value="{{ item.url }}" {% if item.current %}selected="selected"{% else %}{% endif %} >
            {{ '- ' | repeat(level) }}{{ item.name }}
        </option>
        {% snipplet "navigation-mobile.tpl" with navigation = item.subitems, level = level + 1 %}
    {% else %}
        <option value="{{ item.url }}" {% if item.current %}selected="selected"{% else %}{% endif %} >
            {{ item.name }}
        </option>
    {% endif %}
{% endfor %}