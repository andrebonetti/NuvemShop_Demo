<section class="produtos">
		
		<aside>
			            
            {% snipplet "categories.tpl" %}
                        
		</aside>
        
        <div class="produtos-content">
        
            <div class="slide-show" id="slider1_container">

                <!-- Slides Container -->
                <div data-u="slides" class="slide-container">
                    
                    <div class="content">
                        {{ "img/Slides2/Slide-1.jpg" | static_url | img_tag("La No Parque Banner")}}
                    </div>
                    <div class="content">
                        {{ "img/Slides2/Slide-2.jpg" | static_url | img_tag("La No Parque Banner")}}
                    </div>
                    <div class="content">
                        {{ "img/Slides2/Slide-3.jpg" | static_url | img_tag("La No Parque Banner")}}
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
            
            <h1>Nossos Brinquedos</h1>
            
               
            
            <div class="catalogo-produtos">
                
                <div class="cabecalho-catalogo">
                
                    <div class="num-produtos">
                        <p>1 - 12 brinquedos de 73</p>
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
                    <li class="active"><a>1</a></li>
                    <li><a>2</a></li>
                    <li><a>3</a></li>
                    <li><a>4</a></li>
                    <li><a>5</a></li>
                    <li><a>...</a></li>
                    <li><a>Última Página</a></li>
                </ul>
            
            </div>
        
        </div>
				
</section>	