{% for item in navigation %}
            <div class="box">
                <a href="{{ item.url }}" {% if item.url | is_external %}target="_blank"{% endif %}>
                    <div class="img-content">
                        <img class="link" src="//s3-sa-east-1.amazonaws.com/store-templates/templates/143/631/twig/static/img/Categorias/{{ item.name }}.png">
                        <img class="hover" src="//s3-sa-east-1.amazonaws.com/store-templates/templates/143/631/twig/static/img/Categorias/{{ item.name }}_hover.png">
                    </div>
                    <h3>{{ item.name }}</h3>
                </a>	
            </div>
{% endfor %}