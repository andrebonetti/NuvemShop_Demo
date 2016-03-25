{% for item in navigation %}
    <li class="{{ item.current ? 'active' : '' }}">
			<a href="{{ item.url }}" {% if item.url | is_external %}target="_blank"{% endif %}>{{ item.name }}</a>
	</li>
{% endfor %}