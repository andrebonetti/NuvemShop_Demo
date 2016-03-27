        <section class="home">
            
            <div class="destaque">
            
                <h2>Destaques</h2>
                
                <div class="boxes">
                    
                    <!--  nome da seção de destaque -->
                    {% for product in sections.primary.products %}
                    
                        <div class="box">
                            
                            <a class="img-content" href="{{ product.url }}" title="{{ product.name }}">
                                {{ product.featured_image | product_image_url("medium") | img_tag(product.name) }}
                            </a>
                            <h3>{{ product.name }}</h3>
                            <h4>{{ product.price | money }}</h4>

                            <a class="btn-detalhes" href="{{ product.url }}" title="{{ product.name }}">Detalhes</a>
                            
                        </div>
                    
                    {% endfor %}
                                      
                </div>
                
            </div>
            
            <div class="destaque destaque-combo">
                
                <div class="titulos-destaque">
                    <h2><a class="active" href="#">Novidades</a></h2>
                    <h2><a href="#">Promoções</a></h2>
                </div>    
            
                <div class="boxes">
                    
                    <!--  nome da seção de destaque -->
                    {% for product in sections.primary.products %}
                    
                        <div class="box">
                            
                            <a class="img-content" href="{{ product.url }}" title="{{ product.name }}">
                                {{ product.featured_image | product_image_url("medium") | img_tag(product.name) }}
                            </a>
                            <h3><a href="{{ product.url }}" title="{{ product.name }}"> {{ product.name }} </a></h3>
                            <h4>{{ product.price | money }}</h4>
 
                        </div>
                    
                    {% endfor %}
                                  
                </div>    
            
            </div>
        
        </section>  

        <section class="home-banner">
            
            <div class="myContainer">
                
                <div class="banners">

                    <div class="banner formas-pagamento">
                        
                        <div class="img-content">
                            {{ "img/icone_cadeado.png" | static_url | img_tag("Icone Cadeado")}}
                        </div>
                        <h2>Formas de Pagamento</h2>
                        
                        <div class="boxes">
                        
                            <div class="box">
                                {{ "img/Formas_Pagamento/boleto.png" | static_url | img_tag("Icone Boleto")}}
                                <p>Boleto</p>
                            </div>
                            
                            <div class="box">
                                {{ "img/Formas_Pagamento/cartoes_de_credito.png" | static_url | img_tag("Icone Cartao de Credito")}}
                                <p>Cartões de Crédito</p>
                            </div>
                            
                            <div class="box">
                                {{ "img/Formas_Pagamento/deposito.png" | static_url | img_tag("Icone Depósito")}}  
                                <p>Depósito</p>
                            </div>
                            
                            <div class="box">
                                {{ "img/Formas_Pagamento/pag_seguro.png" | static_url | img_tag("Icone Pag Seguro")}}
                                <p>Pag Seguro</p>
                            </div>
                            
                            <div class="box">
                                {{ "img/Formas_Pagamento/transferencia.png" | static_url | img_tag("Icone Transferencia")}}
                                <p>Trânsferencias</p>
                            </div>
                            
                        </div>
                    </div>

                    <div class="banner formas-entrega">
                        
                        <div class="img-content">
                            {{ "img/icone_delivery.png" | static_url | img_tag("Icone Delivery")}}
                        </div>
                        <h2>Formas de Entrega</h2>
                        
                        <div class="boxes">
                        
                            <div class="box">
                                {{ "img/Frete/correios.png" | static_url | img_tag("Icone Correios")}}
                                <p>Correios</p>
                            </div>
                            
                            <div class="box">
                                {{ "img/Frete/pac.png" | static_url | img_tag("Icone PAC")}}
                                <p>PAC</p>
                            </div>
                            
                            <div class="box">
                                {{ "img/Frete/sedex.png" | static_url | img_tag("Icone SEDEX")}}
                                <p>Sedex</p>
                            </div>
                            
                        </div>
                        
                    </div>

                </div>
                             
            </div>    
            
        </section>  
        
        <section class="home-newslatter">
            
            <div class="myContainer">
                
                <h2>Inscreva-se Para Receber as Nossas NewsLatter</h2>
                
                <form>
                
                    <input type="text" class="form-control" Placeholder="Nome Completo">
                    
                    <input type="text" class="form-control" Placeholder="E-mail">
                    
                    <input type="submit" class="btn btn-default" value="Enviar">
                    
                </form>
                
            </div>    
            
        </section> 
          





