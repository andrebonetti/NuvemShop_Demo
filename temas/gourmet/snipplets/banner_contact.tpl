{% set banner_contact %}
<div id="cabezal_interior">
    <div class="container">
        <h3 class="banner-copy {% if settings.banner_products_align == "aligncategory_left" %}text-left
		{% elseif settings.banner_products_align == "aligncategory_right" %}text-right
		{% else %}text-center{% endif %}">
            {% if settings.banner_contact_description %}
                {{ settings.banner_contact_description }}
            {% else %}
                {{ store.name }}
            {% endif %}
        </h3>
    </div>
</div>
{% endset %}
{% if settings.banner_contact_url %}
    <a href="{{ settings.banner_products_url | raw }}">{{ banner_contact }}</a>
{% else %}
    {{ banner_contact }}
{% endif %}