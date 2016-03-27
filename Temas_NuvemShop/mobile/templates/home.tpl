{% if "images/home-banner.png" | has_custom_image %}
<section id="home-banner">
    {% if settings.home_banner_link %}
        <a href="{{ settings.home_banner_link }}">{{ "images/home-banner.png" | static_url | img_tag }}</a>
    {% else %}
        {{ "images/home-banner.png" | static_url | img_tag }}
    {% endif %}
</section>
{% endif %}
{% if sections.primary.products %}
<section id="primary">
    <h2>{{ settings.primary_name }}</h2>
	{% snipplet "carousel.tpl" with products = sections.primary.products %}    
</section>
{% endif %}
{% if sections.secondary.products %}
<section id="secondary">
    <h2>{{ settings.secondary_name }}</h2>
    {% snipplet "products.tpl" with products = sections.secondary.products %}    
</section>
{% endif %}
