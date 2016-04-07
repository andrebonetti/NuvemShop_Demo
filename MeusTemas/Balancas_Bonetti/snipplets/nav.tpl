<div class="menu-principal">
            
    <div class="myContainer">
                
        <nav>
            {% for item in navigation %}
            
                {% if item.name == "Fale Conosco" %}
                    <!-- if item.name == "Fale Conosco" -->
                    <a href="" data-toggle="modal" data-target="#mdlContato">{{ item.name }}</a>
                {% else %}
                    <!-- ELSE - if item.name == "Fale Conosco" -->
                    <a href="{{ item.url }}"{% if item.current %} class="active"{% endif %} {% if item.url | is_external %}target="_blank"{% endif %}>{{ item.name }}</a>
			    {% endif %} 
            
            {% endfor %}
            
        </nav>

        <div class="categorias">
            
            {% for item in navigation %}
                {% if item.subitems %}
                    {% for subItem in item.subitems %}
            
                        {% if subItem.name == 'Categoria 1'%}
                            <a href="{{ subItem.url }}" {% if item.url | is_external %}target="_blank"{% endif %}>{{ subItem.name }}</a>
                        {% endif %}
                        {% if subItem.name == 'Categoria 2'%}
                            <a href="{{ subItem.url }}" {% if item.url | is_external %}target="_blank"{% endif %}>{{ subItem.name }}</a>
                        {% endif %}
                        {% if subItem.name == 'Categoria 3'%}
                            <a href="{{ subItem.url }}" {% if item.url | is_external %}target="_blank"{% endif %}>{{ subItem.name }}</a>
                        {% endif %}
                        {% if subItem.name == 'Categoria 4'%}
                            <a href="{{ subItem.url }}" {% if item.url | is_external %}target="_blank"{% endif %}>{{ subItem.name }}</a>
                        {% endif %}
                    
                    {% endfor %}
            
                {% endif %}
            {% endfor %}
            
            <a href="">Mais +</a>
        </div>
                
    </div>   
    
</div>