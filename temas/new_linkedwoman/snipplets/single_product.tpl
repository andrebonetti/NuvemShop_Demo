<div class="span3">
    <div class="dest-gral">
        <div class="head">
            {% if not product.available %}
                <div class="out-of-stock-product">{{ "Sin stock" | translate }}</div>
            {% endif %}
            {% if product.free_shipping %}
                <div class="free-shipping-product">{{ "Envío sin cargo" | translate }}</div>
            {% endif %}
            {% if product.compare_at_price %}
                <div class="offer-product">{{ "Oferta" | translate }}</div>
            {% endif %}
            <a href="{{ product.url }}?variant={{ product.selected_or_first_available_variant.id }}" title="{{ product.name }}" class="product-image">{{ product.featured_image | product_image_url("medium") | img_tag(product.featured_image.alt) }}</a>
            {% if settings.quick_shop %}
                <a class="product-details-overlay fancybox" href="#quick{{ product.id }}">
                    <span>{{ settings.quick_shop_label }}</span>
                </a>
                {% snipplet "quick-shop.tpl" %}
            {% endif %}
        </div>
        <div class="bajada {% if product.show_installments %}bajada_instalments{% endif %}" itemscope itemtype="http://schema.org/Product">
            <div class="title" itemprop="name"><h3><a href="{{ product.url }}?variant={{ product.selected_or_first_available_variant.id }}" title="{{ product.name }}">{{ product.name }}</a></h3></div>
            <div class="price {% if not product.display_price%}hidden{% endif %}" itemprop="offers" itemscope itemtype="http://schema.org/Offer">
                <span class="price-compare">
                    <span id="compare_price_display" {% if not product.compare_at_price %}class="hidden"{% endif %}>{{ product.compare_at_price | money }}</span>
                </span>
                <span class="price" id="price_display" itemprop="price" {% if not product.display_price %}class="hidden"{% endif %}>{{ product.price | money }}</span>
                {% if product.show_installments %}
                    {% set max_installments_without_interests = product.get_max_installments(false) %}
                    {% if max_installments_without_interests %}
                        <span class="max_installments">{{ "<strong class='installment-amount'>{1}</strong> cuotas sin interés de <strong class='installment-price'>{2}</strong>" | t(max_installments_without_interests.installment, max_installments_without_interests.installment_data.installment_value_cents | money) }}</span>
                    {% else %}
                        {% set max_installments_with_interests = product.get_max_installments %}
                        {% if max_installments_with_interests %}
                            <span class="max_installments">{{ "<strong class='installment-amount'>{1}</strong> cuotas de <strong class='installment-price'>{2}</strong>" | t(max_installments_with_interests.installment, max_installments_with_interests.installment_data.installment_value_cents | money) }}</span>
                        {% endif %}
                    {% endif %}
                {% endif %}
            </div>
        </div>
    </div>
</div>
