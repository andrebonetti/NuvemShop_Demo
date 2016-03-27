<div class="home-container">
    {% if settings.slider %}
        <ul class="homeslider bxslider">
            {% for slide in settings.slider %}
                {% set slide_img = slide.image | static_url %}
                {% set slide_link = slide.link %}
                {% if slide.link is empty %}
                    <li><img src="{{ slide_img }}"/></li>
                {% else %}
                    <li><a href="http://{{ slide_link }}"><img src="{{ slide_img }}"/></a></li>
                {% endif %}
            {% endfor %}
        </ul>
    {% endif %}
    {% if settings.banner_services_home %}
        <div class="banner-services-home">
            {% include 'snipplets/banner-services.tpl' %}
        </div>
    {% endif %} 
    {% if sections.primary.products %}
        <div>
            {% include 'snipplets/product_grid.tpl' with { products : sections.primary.products } %}
        </div>
    {% endif %}
    {% if "banner-home.jpg" | has_custom_image %}
        <div class="container bannerhome">
            {% if settings.banner_home_url != '' %}
                {{ "banner-home.jpg" | static_url | img_tag | a_tag(settings.banner_home_url) }}
            {% else %}
                {{ "banner-home.jpg" | static_url | img_tag }}
            {% endif %}
        </div>
    {% endif %}
    {% if settings.twitter_widget %}
    <div class="container">
        {{ settings.twitter_widget | raw }}
    </div>
    {% endif %}
    {% if store.facebook and settings.show_footer_fb_like_box %}
    <div class="social-title">
        <div class="header"><h3>{{"Síguenos en Facebook" | translate}}</h3></div>
    </div>
    <div class="container facebook-like-widget">
        {{ store.facebook | fb_page_plugin(980,200) }}
    </div>
    {% endif %}
</div>