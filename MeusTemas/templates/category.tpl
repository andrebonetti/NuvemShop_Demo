{% paginate by 20 %}

<section class="produtos">
		
		<aside>
			            
            {% snipplet "categories.tpl" %}
                        
		</aside>
        
        <div class="produtos-content">
        
            <div class="slide-show slide-produtos" id="slider1_container">

                <!-- Slides Container -->
                <div data-u="slides" class="slide-container">
                    
                    <div class="content">
                        {{ "img/Slides2/banner_produtos-1.png" | static_url | img_tag("La No Parque Banner")}}
                    </div>
                    <div class="content">
                        {{ "img/Slides2/banner_produtos-2.png" | static_url | img_tag("La No Parque Banner")}}
                    </div>
                    <div class="content">
                        {{ "img/Slides2/banner_produtos-3.png" | static_url | img_tag("La No Parque Banner")}}
                    </div>
                    <div class="content">
                        {{ "img/Slides2/banner_produtos-4.png" | static_url | img_tag("La No Parque Banner")}}
                    </div>
                    <div class="content">
                        {{ "img/Slides2/banner_produtos-5.png" | static_url | img_tag("La No Parque Banner")}}
                    </div>
                    <div class="content">
                        {{ "img/Slides2/banner_produtos-6.png" | static_url | img_tag("La No Parque Banner")}}
                    </div>
                    <div class="content">
                        {{ "img/Slides2/banner_produtos-7.png" | static_url | img_tag("La No Parque Banner")}}
                    </div>
                    <div class="content">
                        {{ "img/Slides2/banner_produtos-8.png" | static_url | img_tag("La No Parque Banner")}}
                    </div>
                </div>

                <div data-u="navigator" class="jssorb21" style="position: absolute; bottom: 15px; left: 6px;">
                    <div data-u="prototype" style="Width:19px; HEIGHT: 19px; text-align:center; line-height:19px; color:White; font-size:12px;"></div>
                </div>
                
                <!-- Bullet Navigator Skin End -->

                <!-- Arrow Navigator Skin Begin -->
                <!-- Arrow Left -->
                <span data-u="arrowleft" class="jssora21l" style="width: 55px; height: 55px; top: 123px; left: 8px;"></span>
                <!-- Arrow Right -->
                <span data-u="arrowright" class="jssora21r" style="width: 55px; height: 55px; top: 123px; right: 8px"></span>
                <!-- Arrow Navigator Skin End -->
                <a style="display: none" href="http://www.jssor.com">image carousel</a>

                <script>
                    jssor_slider1_starter('slider1_container');
                </script>

            </div> 
            
            <h1>{{ category.name }}</h1>
            
            {% snipplet "breadcrumbs.tpl" %}
            
            <div class="catalogo-produtos">
                
                <div class="cabecalho-catalogo">
                
                    <div class="num-produtos">
                        <p>{{products_count}} Produto(s)</p>
                    </div>
               
                    <!--ORDENAR POR-->
                    <div class="sort-bar">
                        {% snipplet 'sort_by.tpl' %}
                    </div>
                
                </div> 
                
                 <div class="boxes">
                     
                        {% snipplet "product_grid.tpl" %} 
            
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
        
        </div>
				
</section>	

{{ 'js/my_script-category.js' | static_url | script_tag }}  