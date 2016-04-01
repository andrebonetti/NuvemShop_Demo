{% paginate by 20 %}

            <section class="produtos">
                                                
                <div class="produto-content">
                    
                    <h1>{{ category.name }}</h1>
                    
                    {% snipplet "breadcrumbs.tpl" %}
                    
                    <div class="cabecalho">
                    
                        <p class="quantidade-produtos">{{products_count}} Produto(s)</p>
                        
                        <!--ORDENAR POR-->
                        <div class="sort-bar">
                            {% snipplet 'sort_by.tpl' %}
                        </div>
                                                
                    </div>
                    
                    <div class="boxes">
                        
                        {% snipplet "boxes_produtos.tpl" %}  
                          
                    </div>
                    
                    <ul class="pagination">
                        {% if pages.previous %}
                            <li><a href="{{ pages.previous }}">Anterior</a></li>
                        {% endif %}
                        {% for page in pages.numbers %}
                            {% if page.selected %}
                                <li class="active"><a>{{ page.number }}</a></li>
                            {% else %}
                                <li><a href="{{ page.url }}">{{ page.number }}</a></li>
                            {% endif %}
                        {% endfor %}
                        {% if pages.next %}
                            <li><a href="{{ pages.next }}">Siguiente</a></li>
                        {% endif %}   
                    </ul>
                    
                </div>
            
                {% snipplet "aside_categorias_produtos.tpl" %}  
            
        </section>    