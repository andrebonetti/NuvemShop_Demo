<nav class="breadcrumb">
    <ul>
        <li><a href="{{ store.url }}" class="home" title="{{ store.name }}">{{ store.name }}</a></li>
    {% for crumb in breadcrumbs %}
        {% if crumb.last %}
            <li>{{ crumb.name }}</li>
        {% else %}
            <li><a href="{{ crumb.url }}">{{ crumb.name }}</a></li>
        {% endif %}
    {% endfor %}
    </ul>
</nav>
<section id="product">
    <h1>{{ product.name }}</h1>

    <section class="m-carousel">
        <section class="m-carousel-inner">
            {% for image in product.images %}
            <article class="m-item">
                <a href="{{ image | product_image_url('original') }}">
                    {{ image | product_image_url('large') | img_tag(image.alt) }}
                </a>
            </article>
            {% endfor %}
        </section>
        <section class="m-carousel-controls m-carousel-bulleted">  
            {% for i in 1..product.images | length %}
                <a href="#" data-slide="{{ i }}" {% if loop.first %} class="m-active"{% endif %} >{{ i }}</a>
            {% endfor %}
        </section>
    </section>

    {% if product.price %}
    <section id="price">
    {% if product.compare_at_price %}
        <del class="compare-price">{{ product.compare_at_price | money }}</del>
    {% endif %}
    {% if product.price %}
        <p class="price">{{ product.price | money }}</p>
    {% endif %}
    {% if product.display_price and product.installments > 1 %}
        <p class="installments">
            {% set installments %}<span id="installments_number">{{ product.installments }}</span>{% endset %}
            {% if settings.no_interest %}
                {% set installment_amount %}<span id="installments_amount">{{ (product.price / product.installments) | money }}</span>{% endset %}
                {{ "Em até {1}x de {2} sem juros" | t(installments, installment_amount) }}
            {% else %}
                {{ "Em até {1}x no cartão" | translate(installments) }}
            {% endif %}
        </p>
    {% endif %}
    </section>
    {% endif %}

    <section id="variations">
        <form method="post" action="{{ store.cart_url }}">
            <input type="hidden" name="add_to_cart" value="{{product.id}}" />
            {% for variation in product.variations %}
                <label for="variation_loop.index">{{ variation.name }}:</label>
                <select id="variation_{{ loop.index }}" name="variation[{{ variation.id }}]" data-mini="true" onchange="LS.changeVariant(changeVariant)">
                {% for option in variation.options %}
                    <option value="{{ option.id }}" {% if product.default_options[variation.id] == option.id %}selected="selected"{% endif %}>{{ option.name }}</option>
                {% endfor %}
                </select>
            {% endfor %}
            <label for="quantity-input">{{ "Quantidade:" | t }}</label>
            <input id="quantity-input" type="number" value="1" min="1" pattern="[0-9]*" name="quantity" />
            {% set state = store.is_catalog ? 'catalog' : (product.available ? product.display_price ? 'cart' : 'contact' : 'nostock') %}
            {% set texts = {'cart': "Adicionar ao carrinho", 'contact': "Preço sob Consulta", 'nostock': "Esgotado", 'catalog': "Consultar"} %}
            <input class="primary-btn addToCart" type="submit" value="{{ texts[state] | t }}"/>
        </form>
    </section>

    <section id="product-description">
        <h3>{{ "Descrição do produto:" | t }}</h3>
        {{ product.description }}
    </section>

    <section id="product-share">
        <div class="shareItem twitter">{{product.social_url | tw_share('none', 'Tweet', store.twitter_user, current_language.lang) }}</div>
        <div class="shareItem google">{{product.social_url | g_plus('medium') }}</div>
        <div class="shareItem facebook">{{product.social_url | fb_like('store-product', 'button_count')}}</div>
        <div class="shareItem pinterest">{{product.social_url | pin_it('https:' ~ product.featured_image | product_image_url('medium'))}}</div>
    </section>
</section>

<script type="text/javascript">
    $(document).ready(function(){
        $('.m-carousel').carousel();
    });
</script>