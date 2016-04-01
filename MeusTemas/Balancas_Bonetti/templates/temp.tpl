<section class="produtos">
    
        <meta itemprop="description" content="{{ page_description }}" />
        <meta itemprop="image" content="{{ 'http:' ~ product.featured_image | product_image_url('medium') }}" />
        <meta itemprop="url" content="{{ product.social_url }}" />
        <meta itemprop="sku" content="{{ product.sku }}" />
        <div itemprop="weight" itemscope itemtype="http://schema.org/QuantitativeValue" style="display:none;">                                   
            <meta itemprop="unitCode" content="{{ product.weight_unit | iso_to_uncefact}}" />
            <meta itemprop="value" content="{{ product.weight}}" />
        </div>
    
        <div class="produto-content">
            
            <h1>{{ product.name }}</h1>
            
            {% snipplet "breadcrumbs.tpl" %}
            
            <div class="produto-detalhes">
                
                <div class="img-container">
            
                    <!--{{ product.featured_image | product_image_url('large') | img_tag(product.featured_image.alt) }}-->
                    <div class="product-photos img-content">

                        <div class="current-photo">
                            <div class="current-photo-container">
                                {% if product.featured_image %}
                                    <a href="{{ product.featured_image | product_image_url('original') }}" id="zoom" class="cloud-zoom" rel="position: 'inside', showTitle: false, loading: '{{ 'Cargando...' | translate }}'">
                                        {{ product.featured_image | product_image_url('large') | img_tag(product.name) }}
                                    </a>
                                {% else %}
                                    {{ product.featured_image | product_image_url('large') | img_tag(product.name) }}
                                {% endif %}
                            </div>
                        </div>

                        {% if product.images_count > 1 %}
                            <div class="img-thumbs">
                                {% for image in product.images %}

                                    <a href="{{ image | product_image_url('original') }}" class="cloud-zoom-gallery" rel="useZoom: 'zoom', smallImage: '{{ image | product_image_url('large') }}' " data-image="{{image.id}}">
                                        {{ image | product_image_url('thumb') | img_tag(image.alt) }}
                                    </a>

                                {% endfor %}
                            </div>
                        {% endif %}

                    </div>

                </div>
                
                <div class="detalhes">
                    
                           <div class="descricao">
                                
                                <h2>Descrição</h2>
                                
                                <div class="description user-content">
                                    {{ product.description }}
                                </div>
            
                            </div>
                            
                            <div class="extend-descricao">
                                <p>Leia Mais...</p>
                            </div>

                            <div class="hide-descricao">
                                <p>Ocultar Descrição</p>
                            </div>
                            
                            <div class="caracteristicas_tecnicas">
                                
                                <h2>Caracteristicas Técnicas:</h2>
                                
                                <p>Display:LCD</p>
                                <p>Teclado:17 digitos</p>
                                <p>Gabinete de Plastico ABS</p>
                                <p>110/220(Bivolt)</p>
                                <p>Tempo de Recarga:12h</p>
                                
                                
                            </div>
                            
                            <div class="especificacoes">
                                
                                <h2>Especificações:</h2>
                                
                                <p>Capacidade: 30 Kg</p>
                                <p>Precisão: 0.5 g</p>
                                <p>Display: N</p>
                                <p>Bateria: 140h</p>
                                <p>Impressora: N</p>
                                <p>Conexão: Comunicação Serial RS-232</p>
                                
                                <a href="http://www.toledobrasil.com.br/balanca/balancas-de-bancada/3400">Veja a descrição completa no site do fabricante</a>
                                
                            </div>
                    
                            <div class="calculo_frete"></div>
                            
                            <div class="valor">
                                <p class="valor" itemprop="price" {% if not product.display_price %}class="no-view"{% endif %}>Preço: {{ product.price | money }}</p>
                            </div>
                            
                             {% if product.free_shipping %}
                                <div class="circle free-shipping">
                                    <p>{{ "Envío sin cargo" | translate }}</p>
                                </div>
                            {% endif %}
                                        
                </div>    
                
            </div>    
                    
        </div>
    
        {% snipplet "aside_categorias_produtos.tpl" %}
    
        <div class="produtos-relacionados">
            
            <h2>Produtos Relacionados</h2>
            
            <div class="boxes">

                <?php for($i=1;$i <= 10;$i++){?>

                    <div class="box">

                        <a class="img-content" href="produto_detalhes.php">
                            <img src="img/balanca.png">
                        </a>
                        <h2>Nome Produto 1</h2>
                        <p class="valor">R$00,00</p>
                        <a class="btn-detalhes" href="">Detalhes</a>

                    </div>

                <?php } ?>

            </div>
                
        </div>
    
</section>    