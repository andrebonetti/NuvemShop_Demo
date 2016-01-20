{% for product in products %}
<article class="product">
    <a class="img" href="{{ product.url }}">{{ product.featured_image | product_image_url("medium") | img_tag(product.featured_image.alt) }}</a>
    <p>
        <a href="{{ product.url }}">
            <span class="name">{{ product.name }}</span>
            {% if product.compare_at_price %}
            <del class="compare-price">{{ product.compare_at_price | money }}</del>
            {% endif %}
            {% if product.display_price %}
            <span class="price">{{ product.price | money }}</span>
            {% endif %}
        </a>
    </p>
</article>
{% endfor %}