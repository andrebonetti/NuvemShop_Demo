<section class="m-carousel">
    <section class="m-carousel-inner">
        {% for product in products %}
        <article class="m-item">
            <a href="{{ product.url }}">
                {{ product.featured_image | product_image_url('large') | img_tag(product.featured_image.alt) }}
                <span class="name">{{ product.name }}</span>
                {% if product.display_price %}
                <span class="price">
                    {% if product.compare_at_price %}
                        <del class="compare-price">{{ product.compare_at_price | money }}</del><br>
                    {% endif %}
                    {{ product.price | money }}
                </span>
                {% endif %}
            </a>
        </article>
        {% endfor %}
    </section>
    <section class="m-carousel-controls m-carousel-bulleted">  
        {% for i in 1..products | length %}
        <a href="#" data-slide="{{ i }}" {% if loop.first %} class="m-active"{% endif %} >{{ i }}</a>
        {% endfor %}
    </section>
</section>