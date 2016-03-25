{% for item in navigation %}
		{% if item.subitems %}
            <!-- SUB ITENS -->
            <h2>Categorias</h2>
                
            <div class="boxes">
                
                {% snipplet "navigation_home.tpl" with navigation = item.subitems %}
            
            </div>

        {% endif %}
{% endfor %}   