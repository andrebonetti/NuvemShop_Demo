{% if settings.slider and settings.slider is not empty %}
    <div class="row-fluid">
        <ul class="homeslider bxslider">
            {% for slide in settings.slider %}
                {% set slide_img = slide.image | static_url %}
                {% if slide.link is empty %}
                    <li><img src="{{ slide_img }}"/></li>
                {% else %}
                    <li><a href="{{ slide.link }}"><img src="{{ slide_img }}"/></a></li>
                {% endif %}
            {% endfor %}
        </ul>
    </div>
{% endif %}
{% if settings.banner_services_home %} 
     {% include 'snipplets/banner-services.tpl' %}
{% endif %} 
{% set show_help = not (settings.slider | length) and not ("banner-home.jpg" | has_custom_image) and (not has_products or not sections.primary.products) %}
<div class="sections">
    {% if show_help %}
        <div class="headerBox-Page">
            <h2>{{"Bienvenidos" | translate}}</h2>
        </div>
    {% endif %}
</div>
<div class="container-fluid">
    <div class="row-fluid">
        {% if "ban_a.jpg" | has_custom_image %}
            <div class="span4">
                <div class="ban-home">
                    {% if settings.ban_a_url != '' %}
                        <a href="{{ settings.ban_a_url }}">
                            {{ "ban_a.jpg" | static_url | img_tag }}
                        </a>
                    {% else %}
                        {{ "ban_a.jpg" | static_url | img_tag }}
                    {% endif %}
                </div>
            </div>
        {% endif %}
        {% if "ban_b.jpg" | has_custom_image %}
            <div class="span4">
                <div class="ban-home">
                    {% if settings.ban_b_url != '' %}
                        <a href="{{ settings.ban_b_url }}">
                            {{ "ban_b.jpg" | static_url | img_tag }}
                        </a>
                    {% else %}
                        {{ "ban_b.jpg" | static_url | img_tag }}
                    {% endif %}
                </div>
            </div>
        {% endif %}
        {% if "ban_c.jpg" | has_custom_image %}
            <div class="span4">
                <div class="ban-home">
                    {% if settings.ban_c_url != '' %}
                        <a href="{{ settings.ban_c_url }}">
                            {{ "ban_c.jpg" | static_url | img_tag }}
                        </a>
                    {% else %}
                        {{ "ban_c.jpg" | static_url | img_tag }}
                    {% endif %}
                </div>
            </div>
        {% endif %}
    </div>
</div>
{% if settings.welcome_message %}
    <div id="wrap-welcome-message">
        <div class="container-fluid">
            <div class="row-fluid">
                <div class="headerBox">
                    <h2>{{ settings.welcome_message }}</h2>
                </div>
            </div>
        </div>
    </div>
{% endif %}
{% if show_help or sections.primary.products %}
    <div class="container-fluid {% if show_help %}no-products{% endif %}">
        <div class="row-fluid">
            <div class="dest-list">
                {% for product in sections.primary.products if not show_help %}
                    {% include 'snipplets/single_product.tpl' %}
                {% else %}
                    {% for i in 1..4 %}
                        {% set help_url = has_products ? '/admin/products/feature/' : '/admin/products/new/' %}
                        <div class="dest-gral" style="opacity:0.5;">
                            <div class="head">
                                <a href="{{ help_url }}">{{'images/placeholder-product.png' | static_url | img_tag}}</a>
                            </div>
                            <div class="bajada">
                                <div class="title"><a href="{{ help_url }}">{{"Producto" | translate}}</a></div>
                                <div class="price">{{"$0.00" | translate}}</div>
                            </div>
                        </div>
                    {% endfor %}
                {% endfor %}
            </div>
        </div>
    </div>
{% endif %}
{% if settings.show_footer_fb_like_box and store.facebook %}
    <div class="row-fluid">
        <div class="social-title">
            <h1>{{"Seguinos en Facebook" | translate}}</h1>
        </div>
        {{ store.facebook | fb_page_plugin(980,200) }}
    </div>
{% endif %}