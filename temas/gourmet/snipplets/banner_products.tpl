{% set banner_products %}
<div id="cabezal_interior">
    {% if "banner-product-3.jpg" | has_custom_image %}
        {{ 'banner-product-3.jpg' | static_url | img_tag }}
    {% endif %}
    <div class="container">
        <h3 class="banner-copy {% if settings.banner_products_align == "aligncategory_left" %}text-left
                {% elseif settings.banner_products_align == "aligncategory_right" %}text-right
                {% else %}text-center{% endif %}">
            {% if settings.banner_products_description %}
                {{ settings.banner_products_description }}
            {% else %}
                {{ store.name }}
            {% endif %}
        </h3>
    </div>
</div>
{% endset %}
{% if settings.banner_products_url %}
    <a href="{{ settings.banner_products_url | raw }}">{{ banner_products }}</a>
{% else %}
    {{ banner_products }}
{% endif %}