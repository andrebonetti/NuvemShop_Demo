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
            <a href="">Balanças</a>
            <a href="">Cortadores de Frios</a>
            <a href="">Liquidificadores</a>
            <a href="">Serras</a>
            <a href="">Mais +</a>
        </div>
                
    </div>   
    
</div>