<section class="produto_detalhes" id="single-product" itemscope itemtype="http://schema.org/Product">
    
    <meta itemprop="description" content="{{ page_description }}" />
    <meta itemprop="image" content="{{ 'http:' ~ product.featured_image | product_image_url('medium') }}" />
    <meta itemprop="url" content="{{ product.social_url }}" />
    <meta itemprop="sku" content="{{ product.sku }}" />
    <div itemprop="weight" itemscope itemtype="http://schema.org/QuantitativeValue" style="display:none;">                                   
        <meta itemprop="unitCode" content="{{ product.weight_unit | iso_to_uncefact}}" />
        <meta itemprop="value" content="{{ product.weight}}" />
    </div>
    
    <div id="single-product-container" class="produto-content" data-variants="{{product.variants_object | json_encode }}">
        
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
        
        <div class="conteudo">
                
            <h1 itemprop="name">{{ product.name }}</h1>
            
            <div class="description user-content">
                {{ product.description }}
            </div>
            
            <div class="extend-descricao">
                <p>Leia Mais...</p>
            </div>
            
            <div class="hide-descricao">
                <p>Ocultar Descrição</p>
            </div>
                
            <p class="valor" itemprop="price" {% if not product.display_price %}class="no-view"{% endif %}>Preço: {{ product.price | money }}</p>

            <!--<p class="cep-p">Digite se Cep para calcular o frete: </p>
            <input class="form-control cep-input" type="text">-->
                
            
            <!--FRETE-->            
            <!--<button class="frete">Calcular frete:</button>-->
                
            {% if product.free_shipping %}
                <div class="circle free-shipping">
                    <p>{{ "Envío sin cargo" | translate }}</p>
                </div>
            {% endif %}
            
            <form id="product_form" method="post" action="{{ store.cart_url }}">
                
                <input type="hidden" name="add_to_cart" value="{{product.id}}" />
                
                <div class="row-fluid">
                    {% snipplet "shipping_cost_calculator.tpl" with shipping_calculator_show = settings.shipping_calculator_product_page and not product.free_shipping, shipping_calculator_variant = product.selected_or_first_available_variant %}
                </div>
                
                <input type="text" class="form-control carrinho-input" value="1" name="quantity{{ item.id }}" value="CALCULAR FRETE" />                                               
                <input type="submit" class="carrinho-btn" value="INCLUIR NO CARRINHO"/>
                        
            </form>
                          
            <!--<div class="shareLinks">
                
                <div class="shareItem facebook">
                    {{product.social_url | fb_like('store-product', 'button_count')}}
                </div>
                <div class="shareItem twitter">
                    {{product.social_url | tw_share('none', 'Tweet', store.twitter_user, current_language.lang) }}
                </div>
                <div class="shareItem google">
                    {{product.social_url | g_plus('medium') }}
                </div>
                <div class="shareItem pinterest">
                    {{product.social_url | pin_it('http:' ~ product.featured_image | product_image_url('original'))}}
                </div>
                
            </div>-->
                
        </div>
              
        <div id="related-products" class="produtos-relacionados">
        {% if product.metafields.related_products.html %}
            {{ product.metafields.related_products.html | raw }}
        {% else %}
            {% set related_products = category.products | shuffle | take(4) %}
            {% if related_products | length > 1 %}

                            {% set related_products %}
                                {% for related in related_products | shuffle | take(4) %}
                                    {% if product.id != related.id %}
                                        {% include 'snipplets/single_product.tpl' with {product : related} %}
                                    {% endif %}
                                {% endfor %}
                            {% endset %}
                            
                            
                            
                            <div class="boxes">
                                <h2>Produtos Relacionados</h2>
                                
                                {{ related_products }}
                                
                            </div>
                            
                            <div class="visible-phone">
                                {{ related_products }}
                           </div>
                        
            {% endif %}
        {% endif %}
    </div>
        
    {% if installments_info %}
     {% set gateways = installments_info | length %}
    <div id="InstallmentsModal" class="modal hide fade{% if gateways <= '3' %} two-gates{% endif %}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-body">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            <div class="installments">
                <ul class="nav nav-tabs">
                    {% for method, installments in installments_info %}
                        <li id="method_{{ method }}" {% if loop.first %}class="active"{% endif %}><a href="#installment_{{ method }}_{{ installment }}" data-toggle="tab">{{ method == 'paypal_multiple' ? 'PAYPAL' : (method == 'itaushopline'? 'ITAU SHOPLINE' : method | upper) }}</a></li>
                    {% endfor %}
                </ul>
                <div class="tab-content">
                    {% for method, installments in installments_info %}
                                <div class="tab-pane{% if loop.first %} active{% endif %}" id="installment_{{ method }}_">
                                    <div class="span3">
                                    {% for installment, data_installment in installments %}
                                        <span id="installment_{{ method }}_{{ installment }}" >
                                            <strong class="installment-amount">{{ installment }}</strong> x <strong class="installment-price">{{ data_installment.installment_value_cents | money }}</strong>
                                            {% if data_installment.without_interests %} {{ 'sin interés' | t }}{% endif %}
                                        </span>
                                        {% if installment == 12 %}</div><div class="span3">{% endif %}
                                    {% endfor %}
                                    </div>
                                </div>
                    {% endfor %}
                </div>
            </div>
        </div>
    </div> 
    {% endif %}

</section>
    
{{ 'js/my_script-product.js' | static_url | script_tag }}    
