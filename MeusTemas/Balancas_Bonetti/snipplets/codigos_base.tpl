 <div id="content" class="clear">
                    {% if template == "cart" %}
                        <!-- if template == "cart" -->  
                        <!-- template_content \/ -->  
                        {% template_content %}
                    {% else %}
                        <div id="main">
                            <!-- template_content \/ -->
                            {% template_content %}
                        </div>
                        <!-- snipplet "sidebar.tpl" \/ -->
                        {% snipplet "sidebar.tpl" %}
                    {% endif %}
                </div>


                <div id="footer" class="clear">

                    {% if settings.show_footer_fb_like_box and store.facebook %}
                        <!-- if settings.show_footer_fb_like_box and store.facebook -->
                        <div style="margin:10px 0;">
                            <!-- store.facebook | fb_page_plugin(960,190) -->
                            {{ store.facebook | fb_page_plugin(960,190) }}
                        </div>
                    {% endif %}


                        {#
                            La leyenda que aparece debajo de esta linea de código debe mantenerse
                            con las mismas palabras y con su apropiado link a Tienda Nube;
                            como especifican nuestros términos de uso: http://www.tiendanube.com/terminos-de-uso .
                            Si quieres puedes modificar el estilo y posición de la leyenda para que se adapte a
                            tu sitio. Pero debe mantenerse visible para los visitantes y con el link funcional.

                            Os créditos que aparece debaixo da linha de código deverá ser mantida com as mesmas
                            palavras e com seu link para Nuvem Shop; como especificam nossos Termos de Uso:
                            http://www.nuvemshop.com.br/termos-de-uso. Se você quiser poderá alterar o estilo
                            e a posição dos créditos para que ele se adque ao seu site. Porém você precisa
                            manter visivél e com um link funcionando.
                        #}

                    <p>{{"Copyright" | translate }} &copy; {{ "now" | date("Y") }} {{ store.business_name ? store.business_name : store.name }} {{ store.business_id }}. {{ powered_by_link }}.</p>

                    <div class="right">
                        <div class="payments">
                            {% for payment in settings.payments %}
                            {{ payment | payment_logo | img_tag('', {'height' : 29}) }}
                            {% endfor %}
                        </div>
                        <div class="shipping">
                            {% for shipping in settings.shipping %}
                            {{ shipping | shipping_logo | img_tag('', {'height' : 29}) }}
                            {% endfor %}
                            {% if store.afip %}
                                <div class="afip">
                                {{ store.afip | raw }}
                                </div>
                            {% endif %}
                        </div>
                        <div class="seals">
                            {% if ebit %}
                            {{ ebit }}
                            {% endif %}
                            {% if siteforte %}
                            {{ siteforte }}
                            {% endif %}
                        </div>
                    </div>

                </div>

{% if settings.home_display == "slider" or settings.home_display == "both" %}
    <!-- if settings.home_display == "slider" or settings.home_display == "both" -->
    <div class="slider-wrapper theme-light">
        <div class="nivoSlider">
            {% for slide in settings.slider %}
                {% set slide_img = slide.image | static_url %}
                {% if slide.link is empty %}
                    <img src="{{ slide_img }}" data-thumb="{{ slide_img }}" alt="" />
                {% else %}
                    <a href="{{ slide.link }}"><img src="{{ slide_img }}" data-thumb="{{ slide_img }}" alt="" /></a>
                {% endif %}
            {% endfor %}
        </div>
    </div>
{% endif %}

{% if settings.home_display == "products" or settings.home_display == "both" %}
    <!-- if settings.home_display == "products" or settings.home_display == "both" -->
    <div id="showcase" class="clear">
        {% for product in sections.primary.products | take(1) %}
            <div id="details">
                <h3>{{ product.name }}</h3>
                {% if product.display_price %}
                <h4>{{ product.price | money }}</h4>
                {% if product.compare_at_price %}
                <h4><del>{{ product.compare_at_price | money }}</del></h4>
                {% endif %}
                {% endif %}
                <div class="share">
                    <div class="shareItem twitter">
                        {{product.social_url | tw_share('none', 'Tweet', store.twitter_user, current_language.lang) }}
                    </div>
                    <div class="shareItem google"> 
                        {{product.social_url | g_plus('medium') }}
                    </div>
                    <div class="shareItem facebook"> 
                        {{product.social_url | fb_like('store-product', 'button_count')}}
                    </div>
                </div>
                <p>{{ product.description | plain | truncate(215) }}</p>
                <h5 class="clear"><a href="{{ product.url }}">{{ 'Más detalles' | translate}}</a></h5>
            </div>
            <div id="image">
                <a href="{{ product.url }}">{{ product.featured_image | product_image_url("medium") | img_tag(product.featured_image.alt) }}</a>
            </div>
        {% endfor %}
    </div>
{% endif %}

{% if "banner-home.jpg" | has_custom_image %}
    <div class="banner">
        {% if settings.banner_home_url != '' %}
            {{ "banner-home.jpg" | static_url | img_tag | a_tag(settings.banner_home_url) }}
        {% else %}
            {{ "banner-home.jpg" | static_url | img_tag }}
        {% endif %}
    </div>
{% endif %}

{% if settings.welcome_message %}
<div id="excerpt">
	<div>
        {{ settings.welcome_message }}
	</div>
</div>
{% endif %}

<ul id="products" class="clear">
    {% for otherProduct in sections.secondary.products %}
        <li {% if loop.index % 3 == 0 %}class="end"{% endif %}>
            <div class="image">
                <div class="overflow">
                    <div class="align">
                    {% if otherProduct.display_price %}
                        <h6>{{ otherProduct.price | money }}</h6>
                    {% endif %}

                        <div><a href="{{ otherProduct.url}}">{{ otherProduct.featured_image | product_image_url("medium") | img_tag(otherProduct.featured_image.alt) }}</a></div>
                    </div>
                </div>
            </div>
            <p><a href="{{ otherProduct.url}}">{{ otherProduct.name }}</a></p>
        </li>
    {% endfor %}
</ul>