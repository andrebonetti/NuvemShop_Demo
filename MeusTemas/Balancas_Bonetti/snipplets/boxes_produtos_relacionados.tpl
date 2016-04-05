{% if product.metafields.related_products.html %}
    {{ product.metafields.related_products.html | raw }}
    {% else %}
        {% set related_products = category.products | shuffle | take(4) %}
        {% if related_products | length > 1 %}

            <div class="boxes">
                
                {% for related in related_products | shuffle | take(4) %}
                    {% if product.id != related.id %}
                
                        {% set product_url_with_selected_variant = has_filters ?  ( related.url | add_param('variant', related.selected_or_first_available_variant.id)) : related.url %}

                        <div class="box">

                            <a href="{{ product_url_with_selected_variant }}" title="{{ related.name }}" class="img-content product-image{% if not related.available %}out-stock-img{% endif %}">
                                {{ product.featured_image | product_image_url("small") | img_tag(related.featured_image.alt) }}
                            </a>
                            <h2 itemprop="name">{{ related.name }}</h2>
                            <p class="valor">{{ related.price | money }}</p>
                            <a href="{{ product_url_with_selected_variant }}" title="{{ related.name }}" class="btn-detalhes">Detalhes</a>

                        </div>
                
                    {% endif %}
                {% endfor %}

            </div>
                            
    {% endif %}
{% endif %} 

    