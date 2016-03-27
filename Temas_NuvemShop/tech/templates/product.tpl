<div class="container prod_detail" itemscope itemtype="http://schema.org/Product">
    <!-- -->
    <div class="path">
        {% snipplet "breadcrumbs.tpl" %}
    </div>
    <div class="clear"></div>
    <!-- titles -->
    <div class="titles">
        <h1>{{ product.name }}</h1>
    </div>
    <!-- titles -->
    <!--main content-->
    <div id="single-product" itemscope itemtype="http://schema.org/Product">
        <div id="single-product-container" class="productContainer" data-variants="{{product.variants_object | json_encode }}">
            <!--start product image-->
            <div class="col-md-6 col-sm-12 col-xs-12">
                <div class="imagecol">
                    <div class="imagecolContent">
                        {% if not product.available %}
                            <div class="circle out-of-stock">
                                <p>{{ "Sin stock" | translate }}</p>
                            </div>
                        {% endif %}
                        {% if product.free_shipping %}
                            <div class="circle free-shipping">
                                <p>{{ "Envío sin cargo" | translate }}</p>
                            </div>
                        {% endif %}
                        {% if product.compare_at_price %}
                            <div class="offer2">
                                <p>{{ "Oferta" | translate }}</p>
                            </div>
                        {% endif %}
                        {% if product.featured_image %}
                            <a href="{{ product.featured_image | product_image_url('original') }}" id="zoom" class="cloud-zoom" rel="position: 'inside', showTitle: false, loading: '{{ 'Cargando...' | translate }}'">
                                {{ product.featured_image | product_image_url('large') | img_tag(product.featured_image.alt) }}
                            </a>
                        {% else %}
                            {{ product.featured_image | product_image_url('large') | img_tag(product.featured_image.alt) }}
                        {% endif %}
                    </div>
                    {% if product.images_count > 1 %}
                        <div id="thumbs-list" class="{% if product.images_count < 5 %}thumbnails-hide-arrow{% endif %} mThumbnailScroller" data-mts-axis="x">
                            <ul>
                                {% for image in product.images %}
                                    <li><a href="{{ image | product_image_url('original') }}" class="cloud-zoom-gallery img-thumbnail" rel="useZoom: 'zoom', smallImage: '{{ image | product_image_url('large') }}' " data-image="{{image.id}}">
                                            {{ image | product_image_url('small') | img_tag(product.name) }}
                                        </a>
                                    </li>
                                {% endfor %}
                            </ul>
                        </div>
                    {% endif %}
                </div>
                <!-- rg-gallery -->
            </div>
            <!--end product image-->
            <!--start product description-->
            <div class="col-md-6 col-sm-12 col-xs-12 descriptioncol">
                <!--price-->
                <div class="col-md-12 right price-container">
                    <div class="price-holder price right" itemprop="offers" itemscope itemtype="http://schema.org/Offer">
                        <div class="price {% if not product.display_price %}hidden{% endif %}">
							<span class="price-compare">
							<span id="compare_price_display" {% if not product.compare_at_price %}class="hidden"{% endif %}>{{ product.compare_at_price | money }}</span>
							</span>
                            <span class="price" id="price_display" itemprop="price" {% if not product.display_price %}class="hidden"{% endif %}>{{ product.price | money }}</span>
                            <meta itemprop="priceCurrency" content="{{ product.currency }}" />
                            {% if product.stock_control %}
                                <meta itemprop="inventoryLevel" content="{{ product.stock }}" />
                                <meta itemprop="availability" href="http://schema.org/{{ product.stock ? 'InStock' : 'OutOfStock' }}" content="{{ product.stock ? 'In stock' : 'Out of stock' }}" />
                            {% endif %}
                        </div>
                    </div>
                    <meta itemprop="image" content="{{ 'http:' ~ product.featured_image | product_image_url('medium') }}" />
                    <meta itemprop="url" content="{{ product.social_url }}" />
                    {% if page_description %}
                        <meta itemprop="description" content="{{ page_description }}" />
                    {% endif %}
                    {% if product.sku %}
                        <meta itemprop="sku" content="{{ product.sku }}" />
                    {% endif %}
                    {% if product.weight %}
                        <div itemprop="weight" itemscope itemtype="http://schema.org/QuantitativeValue" style="display:none;">
                            <meta itemprop="unitCode" content="{{ product.weight_unit | iso_to_uncefact}}" />
                            <meta itemprop="value" content="{{ product.weight}}" />
                        </div>
                    {% endif %}
                </div>
                <!-- variants -->
                <!--installments-->
                {% snipplet "installments_in_product.tpl" %}
                {% if product.show_installments and product.display_price %}
                    {% set installments_info = product.installments_info %}
                    {% if installments_info %}
                        <a id="button-installments" class="button secondary" href="#InstallmentsModal" role="button" data-toggle="modal">{{ "Ver el detalle de las cuotas" | translate }}</a>
                    {% endif %}
                {% endif %}
                <!--add to cart -->
                <div class="addtocart col-md-12">
                    <form id="product_form" method="post" action="{{ store.cart_url }}">
                        <input type="hidden" name="add_to_cart" value="{{product.id}}" />
                        {% if product.variations %}
                            <div class="fancyContainer row">
                                {% for variation in product.variations %}
                                    <div class="col-md-4 col-xs-12">
                                        <div class="attributeLine">
                                            <label class="variation-label" for="variation_{{loop.index}}">{{variation.name}}</label>
                                            <select id="variation_{{loop.index}}" class="form-control input-sm" name="variation[{{ variation.id }}]" onchange="LS.changeVariant(changeVariant, '#single-product-container')">
                                                {% for option in variation.options %}
                                                    <option value="{{ option.id }}" {% if product.default_options[variation.id] == option.id %}selected="selected"{% endif %}>{{ option.name }}</option>
                                                {% endfor %}
                                            </select>
                                        </div>
                                    </div>
                                {% endfor %}
                            </div>
                        {% endif %}
                        <div class="row productCTAContainer">
                            {% if product.available %}
                                <div class="col-md-2 col-xs-12">
                                    <label class="variation-label">{{ "Cantidad" | translate }}</label>
                                    <input class="spinner" value="1" type="number" name="quantity{{ item.id }}" value="{{ item.quantity }}" />
                                </div>
                            {% endif %}
                            <div class="col-md-10 col-xs-12">
                                <div class="addToCartButton">
                                    {% set state = store.is_catalog ? 'catalog' : (product.available ? product.display_price ? 'cart' : 'contact' : 'nostock') %}
                                    {% set texts = {'cart': "Agregar al carrito", 'contact': "Consultar precio", 'nostock': "Sin stock", 'catalog': "Consultar"} %}
                                    <input type="submit" class="addbutton button addToCart {{state}}" value="{{ texts[state] | translate }}" {% if state == 'nostock' %}disabled{% endif %}/>
                                </div>
                            </div>
                        </div>
                    </form>
                    {% if settings.shipping_calculator %}
                        {% snipplet "shipping_cost_calculator.tpl" with shipping_calculator_show = settings.shipping_calculator_product_page and not product.free_shipping,    shipping_calculator_variant = product.selected_or_first_available_variant %}
                    {% endif %}
                </div>
                <!--share links-->
                <div class="shareLinks right">
                    <div class="shareItem twitter">
                        {{product.social_url | tw_share('none', 'Tweet', store.twitter_user, current_language.lang) }}
                    </div>
                    <div class="shareItem google">
                        {{product.social_url | g_plus('medium') }}
                    </div>
                    <div class="shareItem facebook">
                        {{product.social_url | fb_like('store-product', 'button_count')}}
                    </div>
                    <div class="shareItem pinterest">
                        {{product.social_url | pin_it('http:' ~ product.featured_image | product_image_url('original'))}}
                    </div>
                </div>
                <div class="clear"></div>
                <div class="user-product-description">
                    {% if settings.product_description_position == 'above' %} {{ product.description }} {% endif %}
                </div>
            </div>
        </div>
    </div>
    <div class="user-product-description-fullwidth">
        {% if settings.product_description_position == 'below' %} {{ product.description }} {% endif %}
    </div>
</div>
<!-- FACEBOOK COMMENTS -->
<div class="container" style="overflow:hidden;">
    {% if settings.show_product_fb_comment_box %}
        <div class="fb-comments" data-href="{{ product.social_url }}" data-num-posts="5" data-width="100%"></div>
    {% endif %}
</div>
<!-- FACEBOOK COMMENTS -->
<!-- RELATED -->
<div id="related-products">
    {% if product.metafields.related_products.html %}
        {{ product.metafields.related_products.html | raw }}
    {% else %}
        {% set related_products = category.products | shuffle | take(4) %}
        {% if related_products | length > 1 %}
            <div class="container">
                <div class="container products">
                    {% set related_products %}
                    {% for related in related_products | shuffle | take(4) %}
                        {% if product.id != related.id %}
                            {% include 'snipplets/single_product.tpl' with {product : related} %}
                        {% endif %}
                    {% endfor %}
                    {% endset %}
                    <div class="titles related-title">
                        <h1>{{ "Productos destacados" | translate }}</h1>
                    </div>
                    {{ related_products }}
                </div>
            </div>
        {% endif %}
    {% endif %}
</div>
{% if installments_info %}
    {% set gateways = installments_info | length %}
    <div id="InstallmentsModal" class="modal fade{% if gateways <= '3' %} two-gates{% endif %}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
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
                                    <div class="col-md-12">
                                        <div class="installment-container">
                                            {% for installment, data_installment in installments %}
                                            <span id="installment_{{ method }}_{{ installment }}" class="installment">
									<strong class="installment-amount">{{ installment }}</strong> x <strong class="installment-price">{{ data_installment.installment_value_cents | money }}</strong>
                                                {% if data_installment.without_interests %} {{ 'sin interés' | t }}{% endif %}
									        </span>
                                            {% if installment == 12 %}
                                        </div>
                                        <div class="span3">{% endif %}
                                            {% endfor %}
                                        </div>
                                    </div>
                                </div>
                            {% endfor %}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
{% endif %}
<!-- RELATED -->
<!-- DETAIL PRODUCT -->
<script type="text/javascript">
    (function($){
        $(window).load(function(){
            $("#thumbs-list").mThumbnailScroller({
                axis:"x",
                type:"click-thumb",
                markup:{ buttonsHTML:{left:"<",right:">" } }
            });
            $("#thumbs-list").show();
        });
    })(jQuery);
</script>