        <section class="home" id="atual-page">

            <div class="slide-show" id="slider1_container">

                <!-- Slides Container -->
                <div data-u="slides" class="slide-container">

                    <div class="content">
                        {{ "img/Slides/slide-3.jpg" | static_url | img_tag("La No Parque Banner")}}
                    </div>
                    <div class="content">
                        {{ "img/Slides/slide-2.jpg" | static_url | img_tag("La No Parque Banner")}}
                    </div>
                    <div class="content">
                        {{ "img/Slides/slide-4.jpg" | static_url | img_tag("La No Parque Banner")}}
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
        
            <div class="destaque">
                
                <h2>Produtos em Destaque</h2>
                
                <div class="boxes">
                    
                    <!--  nome da seção de destaque -->
                    {% for product in sections.primary.products %}
                        <div class="box">
                            <a href="{{ product.url }}" title="{{ product.name }}">
                                <div class="img-content">
                                     {{ product.featured_image | product_image_url("medium") | img_tag(product.name) }}
                                </div>
                                <h3>{{ product.name }}</h3>

                                <p class="valor">{{ product.price | money }}</p>
                            </a>
                        </div>
                    {% endfor %}
                    
                </div> 
                        
            </div>
        
            <div class="recentes">
                
                <h2>Produtos Recentes</h2>
                
                <div class="boxes">
                    
                    <!--  nome da seção de destaque -->
                    {% for product in sections.recent.products %}
                        <div class="box">
                            <a href="{{ product.url }}" title="{{ product.name }}">
                                <div class="img-content">
                                     {{ product.featured_image | product_image_url("medium") | img_tag(product.name) }}
                                </div>
                                <h3>{{ product.name }}</h3>

                                <p class="valor">{{ product.price | money }}</p>
                            </a>
                        </div>
                    {% endfor %}
                    
                </div> 
                        
            </div>
        
            <div class="em-breve">
                
                <h2>Em Breve</h2>
                
                <div class="boxes">
                    
                    <!--  nome da seção de destaque -->
                    {% for product in sections.coming.products %}
                        <div class="box">
                            <a href="{{ product.url }}" title="{{ product.name }}">
                                <div class="img-content">
                                     {{ product.featured_image | product_image_url("medium") | img_tag(product.name) }}
                                </div>
                                <h3>{{ product.name }}</h3>

                                <p class="valor">{{ product.price | money }}</p>
                            </a>
                        </div>
                    {% endfor %}
                    
                </div> 
                        
            </div>
        
            <div class="categorias">
                
                <h2>Categorias</h2>
                
                <div class="boxes">
                    <div class="box">
                        <a href="">
	                        <div class="img-content">
	                            <img src="img/Categorias/categoria-1.png">
	                        </div>
                        	<h3>Brinquedos de Madeira</h3>
                        </a>	
                    </div>
                    
                    <div class="box">
                    	<a href="">
	                        <div class="img-content">
	                            <img src="img/Categorias/categoria-2.png">
	                        </div>
                        	<h3>Kits de Ferramentas</h3>
                        </a>
                    </div>
                    
                    <div class="box">
                    	<a href="">
	                        <div class="img-content">
	                            <img src="img/Categorias/categoria-3.png">
	                        </div>
                       		<h3>Quebra-Cabeças</h3>
                        </a> 
                    </div>
                    
                    <div class="box">
                    	<a href="">
	                        <div class="img-content">
	                            <img src="img/Categorias/categoria-4.png">
	                        </div> 
                        	<h3>Formas</h3>
                        </a>  
                    </div>
                    
                </div>
                
            </div>
        
        </section>
