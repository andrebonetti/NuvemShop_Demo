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
                                
                                <div class="extend-descricao">
                                    <p>Leia Mais...</p>
                                </div>

                                <div class="hide-descricao">
                                    <p>Ocultar Descrição</p>
                                </div>
            
                            </div>
                            
                            <form id="product_form" method="post" action="{{ store.cart_url }}">
                                

                                    <div class="especificacoes">

                                        <h2>Variações:</h2>

                                        {% for variation in product.variations %}
                                            <label class="variation-label" for="variation_{{loop.index}}">{{variation.name}}</label>
                                            <select id="variation_{{loop.index}}" class="form-control" name="variation[{{ variation.id }}]">
                                                {% for option in variation.options %}
                                                    <option value="{{ option.id }}" {% if product.default_options[variation.id] == option.id %}selected="selected"{% endif %}>{{ option.name }}</option>
                                                {% endfor %}
                                            </select>
                                        {% endfor %}

                                    </div>
                                
                            
                                <p class="valor" itemprop="price" {% if not product.display_price %}class="no-view"{% endif %}>Preço: {{ product.price | money }}</p>
                            
                                 {% if product.free_shipping %}
                                    <div class="circle free-shipping">
                                        <p class="alert alert-success">{{ "Envío sin cargo" | translate }}</p>
                                    </div>
                                 {% endif %}
                            
                            
                                <input type="hidden" name="add_to_cart" value="{{product.id}}" />
                                
                                <!-- snipplet "shipping_cost_calculator.tpl" \/ -->    
                                {% snipplet "shipping_cost_calculator.tpl" with shipping_calculator_show = settings.shipping_calculator_product_page and not product.free_shipping, shipping_calculator_variant = product.selected_or_first_available_variant %}
        
                                <input type="text" class="form-control carrinho-input" value="1" name="quantity{{ item.id }}" value="CALCULAR FRETE" />                                               
                                <input type="submit" class="carrinho-btn btn btn-success" value="INCLUIR NO CARRINHO"/>

                            </form>
                            
                        </div>
                        
                    </div> 
            
        </div> 
    
        {% snipplet "aside_categorias_produtos.tpl" %}  
    
        <div class="produtos-relacionados">
              
            <h2>Produtos Relacionados</h2>
            
            {% snipplet "boxes_produtos_relacionados.tpl" %}  

        </div>
    
</section>    