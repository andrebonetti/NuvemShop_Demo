        <section class="home" id="atual-page">

            <div class="slide-show" id="slider1_container">

                <!-- Slides Container -->
                <div data-u="slides" class="slide-container">

                    <!--<div class="content">
                        {{ "img/Slides/Banner_loja_brinquedos-1.png" | static_url | img_tag("La No Parque Banner")}}
                    </div>-->
                    <!--<div class="content notificacao">
                        {{ "img/Notificacoes/Notificacao_Ferias.jpg" | static_url | img_tag("Notificação Ferias La No Parque")}}
                    </div>-->
                    <div class="content">
                        <a href="http://www.lanoparque.com.br/produtos/">{{ "img/Slides/Banner_loja_brinquedos-2.png" | static_url | img_tag("La No Parque Banner")}}</a>
                    </div>
                    <div class="content">
                        <a href="http://www.lanoparque.com.br/bicicletas/">{{ "img/Slides/Banner_loja_brinquedos-3.png" | static_url | img_tag("La No Parque Banner")}}</a>
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
                
                <h2>Promoção</h2>
                
                <div class="boxes">
                    
                    <!--  nome da seção de destaque -->
                    {% for product in sections.offer.products %}
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
                
                {% snipplet "categories_home.tpl" %}
                
            </div>
            
            <div class="extend-categorias">
                <p>Todas as Categorias</p>
                {{ "img/arrow_down.png" | static_url | img_tag("Mostrar Categorias Brinquedos Parque", {'class' : "link"})}}
                {{ "img/arrow_down_hover.png" | static_url | img_tag("Mostrar Categorias Brinquedos Parque", {'class' : "hover"})}}
            </div>
        
            <div class="hide-categorias">
                <p>Ocultar Categorias</p>
                {{ "img/arrow_up.png" | static_url | img_tag("Ocultar Categorias Brinquedos Parque", {'class' : "link"})}}
                {{ "img/arrow_up_hover.png" | static_url | img_tag("Ocultar Categorias Brinquedos Parque", {'class' : "hover"})}}
            </div>
            
            <div class="newsletter">
                {{ "img/Slides/Banner_loja_brinquedos-1.png" | static_url | img_tag("Banner Newslatter", {'class' : "newslatter_banner"})}}
                <!--<h2>Newsletter</h2>-->
                {% if settings.news_txt %}
                    <p>{{ settings.news_txt }}</p>
                {% endif %}
                {% snipplet "newsletter.tpl" %}
            </div>
            
        </section>

{{ 'js/my_script-home.js' | static_url | script_tag }}