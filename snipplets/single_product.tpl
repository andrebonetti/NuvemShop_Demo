        {% if not product.available %}
            <!--<div class="circle out-of-stock">
            	<p>{{ "Sin stock" | translate }}</p>
			</div>-->
        {% endif %}

        {% if product.free_shipping %}
            <!--<div class="circle free-shipping {% if not product.compare_at_price %}shipping-top{% endif %}">
                <p>{{ "Envío sin cargo" | translate }}</p>
            </div>-->
        {% endif %}

        {% if product.compare_at_price %}
            <!--<div class="circle offer {% if not product.available %}offer-right{% endif %}">
            	<p>{{ "Oferta" | translate }}</p>
            </div>-->
        {% endif %}

        {% set product_url_with_selected_variant = has_filters ?  ( product.url | add_param('variant', product.selected_or_first_available_variant.id)) : product.url %}
        
        <div class="box">
            <a href="{{ product_url_with_selected_variant }}" title="{{ product.name }}" class="product-image{% if not product.available %}out-stock-img{% endif %}">

               <div class="img-content">
                    {{ product.featured_image | product_image_url("small") | img_tag(product.featured_image.alt) }}
                </div>    

                <h3 itemprop="name">{{ product.name }}</h3>
                <p class="valor">{{ product.price | money }}</p>

            </a>
        </div>    
        