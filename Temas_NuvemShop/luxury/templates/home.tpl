{# Only remove this if you want to take away the theme onboarding advices #}
{% set show_help = not has_products %}
{% set help_url = has_products ? '/admin/products/feature/' : '/admin/products/new/' %}
{% if settings.slider and settings.slider is not empty %}
    <div class="row-fluid">
        <div class="homeslider bxslider">
            {% for slide in settings.slider %}
                {% set slide_img = slide.image | static_url %}
                {% if slide.link is empty %}
                    <li><img src="{{ slide_img }}"/></li>
                {% else %}
                    <li><a href="{{ slide.link }}"><img src="{{ slide_img }}"/></a></li>
                {% endif %}
            {% endfor %}
        </div>
    </div>
{% endif %}
{% if settings.banner_services_home %} 
     {% include 'snipplets/banner-services.tpl' %}
{% endif %} 
{% if settings.banner_place == "top_a" %}
    {% include 'snipplets/banner.tpl' %}
{% endif %}

{% set help_url = has_products ? '/admin/products/feature/' : '/admin/products/new/' %}

{# This will show default products in the home page before you charge some products #}
{% if show_help %}
    <div class="hidden-phone">
            {% snipplet 'defaults/show_help.tpl' %}
    </div>
    <div class="visible-phone">
         {% snipplet 'defaults/show_help_category.tpl' %}
    </div>
{% endif %}
{# END of show default products in the home page #}

{% if not show_help %}
    {% if sections.primary.products %}
        <div class="row-fluid">
            <div class="container">
                <div class="dest-list">
                    <h2>{{"Productos destacados" | translate}}</h2>
                    {% set primary_section_products %}
                    {% for product in sections.primary.products %}
                        {% include 'snipplets/single_product.tpl' %}
                    {% endfor %}
                    {% endset %}
                    <div id="tS1" class="jThumbnailScroller">
                        <div class="jTscrollerContainer">
                            <div class="jTscroller">
                                {{ primary_section_products }}
                            </div>
                        </div>
                        <a href="#" class="jTscrollerPrevButton">
                            <i class="fa fa-angle-left fa-4x"></i>
                        </a>
                        <a href="#" class="jTscrollerNextButton">
                            <i class="fa fa-angle-right fa-4x"></i>
                        </a>
                    </div>
                    <div class="featured-products">
                        {{ primary_section_products }}
                    </div>
                </div>
            </div>
        </div>
    {% endif %}
{% endif %}
{% if settings.welcome_message or show_help %}
    <div class="row-fluid">
        <div class="container">
            <div id="wrap-welcome-message">
                <div class="headerBox">
                    {% if show_help and not settings.welcome_message  %}
                        <h2>{{ "Este es un banner de ejemplo, luego podrás elegir tu propio banner" | t }}</h2>
                    {% else %}
                        <h2>{{ settings.welcome_message }}</h2>
                    {% endif %}
                    {% if settings.welcome_message_link and settings.welcome_message_link_url %}
                        <a href="{{ settings.welcome_message_link_url }}">{{ settings.welcome_message_link }}</a>
                    {% endif %}
                </div>
            </div>
        </div>
    </div>
{% endif %}
{% if settings.banner_place == "middle" %} 
    {% include 'snipplets/banner.tpl' %}
{% endif %} 
{% if not show_help %}
<div class="row-fluid">
    <div class="container">
        {% if sections.recent.products %}
            <div class="span4">
                <div class="dest-list line-sec">
                    <h2>{{"Productos recientes" | translate}}</h2>
                    <div id="tS3-recent" class="jThumbnailScroller hidden-phone">
                        <div class="jTscrollerContainer">
                            <div class="jTscroller">
                                {% for product in sections.recent.products %}
                                    {% include 'snipplets/single_product_second.tpl' %}
                                {% endfor %}
                            </div>
                        </div>
                        <a href="#" class="jTscrollerPrevButton"><i class="fa fa-angle-up fa-3x"></i></a>
                    <a href="#" class="jTscrollerNextButton"><i class="fa fa-angle-down fa-3x"></i></a>
                    </div>
                    <div class="recent-products">
                        {% for product in sections.recent.products | shuffle %}
                            {% include 'snipplets/single_product_second.tpl' %}
                        {% endfor %}
                    </div>
                </div>
            </div>
        {% endif %}
        {% if sections.offer.products %}
            <div class="span4">
                <div class="dest-list line-sec">
                    <h2>{{"Productos en oferta" | translate}}</h2>
                    <div id="tS3-offer" class="jThumbnailScroller hidden-phone">
                        <div class="jTscrollerContainer">
                            <div class="jTscroller">
                                {% for product in sections.offer.products %}
                                    {% include 'snipplets/single_product_second.tpl' %}
                                {% endfor %}
                            </div>
                        </div>
                        <a href="#" class="jTscrollerPrevButton"><i class="fa fa-angle-up fa-3x"></i></a>
                    <a href="#" class="jTscrollerNextButton"><i class="fa fa-angle-down fa-3x"></i></a>
                    </div>
                    <div class="offer-products">
                        {% for product in sections.offer.products | shuffle %}
                            {% include 'snipplets/single_product_second.tpl' %}
                        {% else %}
                            {% if show_help %}
                                    <div class="dest-gral">
                                        <div class="head">
                                            <a href="{{ help_url }}">{{'images/help-product-02.jpg' | static_url | img_tag}}</a>
                                        </div>
                                        <div class="bajada">
                                            <div class="title"><a href="{{ help_url }}">{{"Producto" | translate}}</a></div>
                                            <div class="price">{{"$0.00" | translate}}</div>
                                        </div>
                                    </div>
                            {% endif %}
                        {% endfor %}
                    </div>
                </div>
            </div>
        {% endif %}
        {% if sections.coming.products %}
            <div class="span4">
                <div class="dest-list line-sec">
                    <h2>{{"Próximamente" | translate}}</h2>
                    <div id="tS3-coming" class="jThumbnailScroller hidden-phone">
                        <div class="jTscrollerContainer">
                            <div class="jTscroller">
                                {% for product in sections.coming.products %}
                                    {% include 'snipplets/single_product_second.tpl' %}
                                {% endfor %}
                            </div>
                        </div>
                       <a href="#" class="jTscrollerPrevButton"><i class="fa fa-angle-up fa-3x"></i></a>
                    <a href="#" class="jTscrollerNextButton"><i class="fa fa-angle-down fa-3x"></i></a>
                    </div>
                    <div class="coming-products">
                        {% for product in sections.coming.products | shuffle %}
                            {% include 'snipplets/single_product_second.tpl' %}
                        {% endfor %}
                    </div>
                </div>
            </div>
        {% endif %}
    </div>
</div>
{% else %}
    {% snipplet 'defaults/show_help_sliders.tpl' %}
{% endif %}
{% if settings.banner_place == "bottom" %} 
    {% include 'snipplets/banner.tpl' %}
{% endif %} 
{% if settings.show_footer_fb_like_box and store.facebook %}
    <div class="row-fluid">
        <div class="social-title">
            <div class="header">{{"Síguenos en Facebook" | translate}}</div>
        </div>
        {{ store.facebook | fb_page_plugin(980,200) }}
    </div>
{% endif %}