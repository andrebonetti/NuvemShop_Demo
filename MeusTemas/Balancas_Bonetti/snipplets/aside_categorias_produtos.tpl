<aside class="categorias_produtos">
                    
    <h2>Categorias</h2>
    
    {% for item in navigation %}
		{% if item.subitems %}
            {% for subItem in item.subitems %}
                <a class="{{ subItem.current ? 'active' : '' }}" href="{{ subItem.url }}" {% if item.url | is_external %}target="_blank"{% endif %}>{{ subItem.name }}</a>
            {% endfor %}
        {% endif %}
    {% endfor %} 
    
                           
</aside>