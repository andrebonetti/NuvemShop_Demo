<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:fb="http://www.facebook.com/2008/fbml" xmlns:og="http://opengraphprotocol.org/schema/">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{{ page_title }}</title>
    <meta name="description" content="{{ page_description }}" />
    {% if settings.fb_admins %}
        <meta property="fb:admins" content="{{ settings.fb_admins }}" />
    {% endif %}
    {% if store_fb_app_id %}
        <meta property="fb:app_id" content="{{ store_fb_app_id }}" />
    {% elseif not store.has_custom_domain %}
        <meta property="fb:app_id" content="{{ fb_app.id }}" />
    {% endif %}
    {{ store.name | og('site_name') }}
    {% if template == 'home' and store.logo %}
        {{ ('http:' ~ store.logo) | og('image') }}
        {{ ('https:' ~ store.logo) | og('image:secure_url') }}
    {% endif %}
    {% if template == 'product' %}
        {# Twitter #}
        <meta name="twitter:card" content="product" />
        <meta name="twitter:url" content="{{ product.social_url }}" />
        <meta name="twitter:image:src" content="{{ ('http:' ~ product.featured_image | product_image_url('huge')) }}" />
        {% if store.twitter_user %}
            <meta name="twitter:site" content="{{ store.twitter_user }}" />
        {% endif %}
        <meta name="twitter:title" content="{{ product.name }}" />
        <meta name="twitter:data1" content="{{ product.display_price ? product.price | money_long : 'Consultar' | translate }}" />
        <meta name="twitter:label1" content="{{ 'Precio' | translate | upper }}" />
        <meta name="twitter:data2" content="{{ product.stock_control ? (product.stock > 0 ? product.stock : 'No' | translate) : 'Si' | translate }}" />
        <meta name="twitter:label2" content="{{ 'Stock' | translate | upper }}" />
        {# Facebook #}
        {{ product.social_url | og('url') }}
        {{ product.name | og('title') }}
        {{ page_description | og('description') }}
        {{ "#{fb_app.namespace}:product" | og('type') }}
        {{ ('http:' ~ product.featured_image | product_image_url('medium')) | og('image') }}
        {{ ('https:' ~ product.featured_image | product_image_url('medium')) | og('image:secure_url') }}
        {% if product.display_price %}
            {{ (product.price / 100) | og_fb_app('price') }}
        {% endif %}
        {% if product.stock_control %}
            {{ product.stock | og_fb_app('stock') }}
        {% endif %}
    {% endif %}
    <!-- CSS -->
    {{ '//fonts.googleapis.com/css?family=Lato:100,300,400,700,900|Oswald:400,700,300' | css_tag}}
    {{ '//netdna.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css' | css_tag }}
    {{ '//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css' | css_tag }}
    {{ 'css/colors.scss.tpl' | static_url | css_tag }}
    {{ 'css/style.css' | static_url | css_tag }}
    {{ '//ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js' | script_tag }}
    {% set nojquery = true %}
    {% head_content %}

    <style>
        {{ settings.css_code }}
    </style>
</head>
<body itemscope itemtype="http://schema.org/WebPage" itemid="body">
{{back_to_admin}}
{{ social_js }}
{% if template == 'account.login' or template == 'account.register' %}
    <script type="text/javascript">
        function loginFacebook() {
            LS.facebookLogin(FB, function(status, hasEmail) {
                if (status === 'connected') {
                    if (hasEmail) {
                        window.location = "{{ store.url }}/account/facebook_login/";
                    } else {
                        $('#login-form').prepend(
                                "<div class=\"st alert alert-error c\">{{ 'Tienes que compartír tu e-mail' | translate }}</div>");
                    }
                } else {
                    $('#login-form').prepend(
                            "<div class=\"st alert alert-error c\">{{ 'Debes completar el login' | translate }}</div>");
                }
            });
        }
    </script>
{% endif %}
<div class="navbar-wrapper">
        <!--fixed Desktop Navigation-->
        {% if settings.fixed_menu %}
            <div class="navbar-bg desktop-nav-fixed">
                <div class="container">
                    <ul class="nav navbar-nav sf-menu hidden-sm hidden-xs" id="menudrop">
                        {% snipplet "navigation.tpl" %}
                        <li style="float:right;">
                            <div class="searchbox">
                                <!-- search -->
                                <div class="pull-right hidden-xs hidden-sm">
                                    <form action="{{ store.search_url }}" method="get">
                                        <input class="text-input" type="text" name="q" placeholder="{{ 'Buscar' | translate }}"/>
                                        <input class="submit-button" type="submit" value="&#xf002;" style="font-family: FontAwesome, 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size:14px;" />
                                    </form>
                                </div>
                            </div>
                            <!-- search -->
                        </li>
                    </ul>
                </div>
            </div>    
        {% endif %}
        <div class="container">
        <div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <div class="container">
                <div class="header-logo">
                    <!-- header logo -->
                    <div class="mobile mobile-nav visible-phone visible-tablet">
                        <div class="menu-btn"><i class="fa fa-bars"></i></div>
                    </div>
                    <div class="col-lg-7 col-md-7 col-xs-12 logo-container">
                        {% if has_logo %}
                            {% if template == 'home' %}
                                <h1 class="img logo">
                                    {{ store.logo  | img_tag(store.name) | a_tag(store.url)}}
                                </h1>
                            {% else %}
                                <div class="img logo">
                                    {{ store.logo  | img_tag(store.name) | a_tag(store.url)}}
                                </div>
                            {% endif %}
                        {% else %}
                            {% if template == 'home' %}
                                <h1>
                                    <div class="logo text-only">
                                        <a href="{{ store.url }}" >{{ store.name }}</a>
                                    </div>
                                </h1>
                            {% else %}
                                <div class="not-h1-logo">
                                    <div class="logo text-only">
                                        <a href="{{ store.url }}" >{{ store.name }}</a>
                                    </div>
                                </div>
                            {% endif %}
                        {% endif %}
                    </div>
                    <div class="col-lg-5 col-md-5 col-xs-12 social-container">
                        <div class="lang">
                            <!-- language -->
                            {% if languages | length > 1 %}
                                {% for language in languages %}
                                    {% set class = language.active ? "active" : "" %}
                                    <a href="{{ language.url }}" class="{{ class }}">{{ language.country | flag_url | img_tag(language.name) }}</a>
                                {% endfor %}
                            {% endif %}
                        </div>
                        <!-- language -->
                        {% if store.facebook or store.twitter or store.google_plus or store.pinterest or store.instagram %}
                            <div class="followus">
                                <!-- follow us -->
                                <div class="right">
                                    <span>{{ 'Seguinos' | translate }}</span>
                                    {% for sn in ['facebook', 'twitter', 'google_plus', 'pinterest', 'instagram'] %}
                                        {% set sn_url = attribute(store,sn) %}
                                        {% if sn_url %}
                                            <a class="soc-foot {{ sn }}" href="{{ sn_url }}" target="_blank" {% if sn == 'google_plus' %}rel="publisher"{% endif %}><i class="fa fa-{{ sn }} fa-4x"></i></a>
                                        {% endif %}
                                    {% endfor %}
                                </div>
                            </div>
                        {% endif  %}
                        <!-- follow us-->
                    </div>
                    <div class="clear"></div>
                </div>
                <!-- header logo -->
            </div>
            <div class="container">
                <div class="clear"></div>
                <div class="login-home">
                    <div class="customer-container">
                        {% if store.has_accounts %}
                            {% if not customer %}
                                {% if store.customer_accounts != 'mandatory' %}
                                    <div class="left">{{ "Crear cuenta" | translate | a_tag(store.customer_register_url) }}</div>
                                {% endif %}
                                <div class="left">{{ "Iniciar sesión" | translate | a_tag(store.customer_login_url) }}</div>
                            {% else %}
                                {{ "Mi cuenta" | translate | a_tag(store.customer_home_url) }}
                                {{ "Cerrar sesión" | translate | a_tag(store.customer_logout_url) }}
                            {% endif %}
                        {% endif %}
                    </div>
                    {% snipplet "cart.tpl" as "cart" %}
                    <div class="clear"></div>
                </div>
            </div>
            <!--Desktop Navigation-->
            <div class="navbar-bg">
                <div class="container">
                    <div class="navbar-header">
                        <div class="searchbox visible-xs visible-sm">
                            <!-- search -->
                            <div class="pull-right">
                                <form action="{{ store.search_url }}" method="get">
                                    <input class="text-input" type="text" name="q" placeholder="{{ 'Buscar' | translate }}"/>
                                    <input class="submit-button" type="submit" value="&#xf002;" style="font-family: FontAwesome, 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size:14px;" />
                                </form>
                            </div>
                        </div>
                    </div>
                    <ul class="nav navbar-nav sf-menu hidden-sm hidden-xs" id="menudrop">
                        {% snipplet "navigation.tpl" %}
                        <li style="float:right;">
                            <div class="searchbox">
                                <!-- search -->
                                <div class="pull-right hidden-xs hidden-sm">
                                    <form action="{{ store.search_url }}" method="get">
                                        <input class="text-input" type="text" name="q" placeholder="{{ 'Buscar' | translate }}"/>
                                        <input class="submit-button" type="submit" value="&#xf002;" style="font-family: FontAwesome, 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size:14px;" />
                                    </form>
                                </div>
                            </div>
                            <!-- search -->
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Pushy Menu -->
<nav class="pushy pushy-left">
    <ul>
         {% snipplet "navigation-mobile.tpl" %}
    </ul>
</nav>
<!-- Site Overlay -->
<div class="site-overlay"></div>
{% template_content %}
</div><!-- /.container -->
{% if settings.banner_services %}
    <div class="banner-services-footer">
        {% include 'snipplets/banner-services.tpl' %}
    </div>
{% endif %}
<!-- FOOTER -->
<div class="footer">
    <div class="footer1">
        <!-- footer 1 -->
        <div class="container">
            {% if settings.payments or settings.shipping %}
                <div class="col-md-4 col-lg-4 col-xs-12 footer-col-container">
                    {% if settings.payments %}
                    <div class="payment-container">
                        <h1>{{ 'Medios de pago' | translate }}</h1>
                        {% for payment in settings.payments %}
                            {{ payment | payment_logo | img_tag('', {'height' : 29}) }}
                        {% endfor %}
                        </div>
                    {% endif %}
                    {% if settings.shipping %}
                    <div class="shipping-container">
                        <h1>{{ 'Formas de envío' | translate }}</h1>
                        {% for shipping in settings.shipping %}
                            {{ shipping | shipping_logo | img_tag('', {'height' : 29}) }}
                        {% endfor %}
                    </div>
                    {% endif %}
                </div>
            {% endif %}
            {% if store.facebook or store.twitter or store.google_plus or store.pinterest or store.instagram %}
                <div class="col-md-4 col-lg-4 col-xs-12 footer-col-container">
                    <h1>{{ 'Redes sociales' | translate }}</h1>
                    <div id="wrapper-social">
                        <div class="row-fluid">
                            <div class="followus">
                                {% for sn in ['facebook', 'twitter', 'google_plus', 'pinterest', 'instagram'] %}
                                    {% set sn_url = attribute(store,sn) %}
                                    {% if sn_url %}
                                        <a class="soc-foot {{ sn }}" href="{{ sn_url }}" target="_blank" {% if sn == 'google_plus' %}rel="publisher"{% endif %}><i class="fa fa-{{ sn }} fa-4x"></i></a>
                                    {% endif %}
                                {% endfor %}
                            </div>
                        </div>
                    </div>
                </div>
            {% endif  %}
            <!-- follow us-->
            <div class="newsletter-container footer-col-container">
                {% snipplet "newsletter.tpl" %}
            </div>
        </div>
        <div class="clear"></div>
    </div>
    <!-- footer 1-->
    <div class="clear"></div>
    <div class="footer2">
        <!-- footer 2 -->
        <div class="container">
            <div class="col-md-4 col-lg-4 col-xs-12 footer-col-container">
                <h1>{{ settings.label_contact_menu }}</h1>
                <div class="menu">
                    <ul>
                        {% snipplet "navigation-foot.tpl" %}
                    </ul>
                </div>
            </div>
           
             <div class="col-md-4 col-lg-4 col-xs-12 seals footer-col-container">
                     <div class="col-foot">
                        <h1>{{ "Seguridad y Certificaciones" | translate }}</h1>
                        <div class="seals row" {% if not (store.afip or ebit or siteforte) %}style="display: none;"{% endif %}>
                            {% if store.afip %}
                                <div class="afip">
                                    {{ store.afip | raw }}
                                </div>
                            {% endif %}
                            {% if ebit %}
                                <div class="ebit">
                                    {{ ebit }}
                                </div>
                            {% endif %}
                            {% if siteforte %}
                                <div class="siteforte">
                                    {{ siteforte }}
                                </div>
                            {% endif %}
                        </div>
                    </div>
             </div>         

            {% if store.phone or store.address or store.blog %}
                <div class="col-md-4 col-lg-4 col-xs-12 contactanos footer-col-container">
                    <h1>{{ 'Contactanos' | translate }}</h1>
                    {% if store.phone %}<p>{{ store.phone }}</p>{% endif %}
                    {% if store.address %}<p>{{ store.address }}</p>{% endif %}
                    {% if store.email %}<p><a href="mailto:{% if store.email %}{{ store.email }}{% endif %}">{{ store.email }}</a></p>{% endif %}
                    {% if store.blog %}<p><a target="_blank" href="{{ store.blog }}">{{ store.blog }}</a></p>{% endif %}    
                </div>
            {% endif %}
        </div>
    </div>
    <!-- footer 2 -->
    <div class="clear"></div>
    <div class="copy">
        <!-- copy -->
        <div class="container">
            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 copyleft">{{ "Copyright {1} - {2}. Todos los derechos reservados." | translate( (store.business_name ? store.business_name : store.name) ~ (store.business_id ? ' - ' ~ store.business_id : ''), "now" | date('Y') ) }}</div>
            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 copyright">{{powered_by_link}}</div>
            <div class="clear"></div>
        </div>
    </div>
    <!-- copy -->
</div>
<!-- FOOTER -->
{{ '//netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js' | script_tag }}
{{ 'js/tech.js' | static_url | script_tag }}
{{ '//maps.googleapis.com/maps/api/js?sensor=false' | script_tag }}
<script type="text/javascript">
//Hamburguer Menu Javascript
$(".mobile-dropdown").click(function(){
    $(this).next("#accordion").slideToggle(300);
    $(this).toggleClass("dropdown-selected");
});
</script>
<script type="text/javascript">
    function get_max_installments_without_interests(number_of_installment, installment_data, max_installments_without_interests) {
        if (parseInt(number_of_installment) > parseInt(max_installments_without_interests[0])) {
            if (installment_data.without_interests) {
                return [number_of_installment, installment_data.installment_value.toFixed(2)];
            }
        }
        return max_installments_without_interests;
    }

    function get_max_installments_with_interests(number_of_installment, installment_data, max_installments_with_interests) {
        if (parseInt(number_of_installment) > parseInt(max_installments_with_interests[0])) {
            if (installment_data.without_interests == false) {
                return [number_of_installment, installment_data.installment_value.toFixed(2)];
            }
        }
        return max_installments_with_interests;
    }

    function changeVariant(variant){
        $("#shipping-calculator-response").hide();
        $("#shipping-variant-id").val(variant.id);

        var parent = $("body");
        if (variant.element){
            parent = $(variant.element);
        }

        var sku = parent.find('#sku');
        if(sku.length) {
            sku.text(variant.sku).show();
        }

        var installment_helper = function($element, amount, price){
            $element.find('.installment-amount').text(amount);
            $element.find('.installment-price').text(LS.currency.display_short + price);
        };

        if (variant.installments_data) {
            var variant_installments = JSON.parse(variant.installments_data);
            var max_installments_without_interests = [0,0];
            var max_installments_with_interests = [0,0];
            $.each(variant_installments, function(payment_method, installments) {
                $.each(installments, function(number_of_installment, installment_data) {
                    max_installments_without_interests = get_max_installments_without_interests(number_of_installment, installment_data, max_installments_without_interests);
                    max_installments_with_interests = get_max_installments_with_interests(number_of_installment, installment_data, max_installments_with_interests);
                    var installment_container_selector = '#installment_' + payment_method + '_' + number_of_installment;
                    installment_helper($(installment_container_selector), number_of_installment, installment_data.installment_value.toFixed(2));
                });
            });
            var $installments_container = $('.installments.max_installments_container .max_installments');
            var $installments_modal_link = $('#button-installments');

            var installments_to_use = max_installments_without_interests[0] > 1 ? max_installments_without_interests : max_installments_with_interests;

            if(installments_to_use[0] <= 1 ) {
                $installments_container.hide();
                $installments_modal_link.hide();
            } else {
                $installments_container.show();
                $installments_modal_link.show();
                installment_helper($installments_container, installments_to_use[0], installments_to_use[1]);
            }
        }

        if (variant.price_short){
            parent.find('#price_display').text(variant.price_short).show();
        } else {
            parent.find('#price_display').hide();
        }

        if (variant.compare_at_price_short){
            parent.find('#compare_price_display').text(variant.compare_at_price_short).show();
        } else {
            parent.find('#compare_price_display').hide();
        }

        if(variant.contact) {
            parent.find('.container-box').hide();
        } else {
            parent.find('.container-box').show();
        }

        var button = parent.find('.addToCart');
        button.removeClass('cart').removeClass('contact').removeClass('nostock');
        {% if not store.is_catalog %}
        if (!variant.available){
            button.val('{{ "Sin stock" | translate }}');
            button.addClass('nostock');
            button.attr('disabled', 'disabled');
            $("#shipping-calculator-form").hide();
        } else if (variant.contact) {
            button.val('{{ "Consultar precio" | translate }}');
            button.addClass('contact');
            button.removeAttr('disabled');
            $("#shipping-calculator-form").hide();
        } else {
            button.val('{{ "Agregar al carrito" | translate }}');
            button.addClass('cart');
            button.removeAttr('disabled');
            $("#shipping-calculator-form").show();
        }

        {% endif %}
    }
    $(document).ready(function(){

        $('.bxslider').bxSlider({
            auto: {% if settings.slider_auto and settings.slider | length > 1 %}true{% else %}false{% endif %},
            pause: 5000,
            autoHover: true,
            adaptiveHeight: false,
            captions: false,
        });
        var example = $('#menudrop').superfish({
            //add options here if required
        });

        {% if settings.slider | length == 1 %}
        $('.bx-pager').remove();
        {% endif %}

        {% if contact and contact.success and contact.type == 'newsletter' %}
        var $newsletter = $('#newsletter');
        $newsletter.find('form').hide();
        $newsletter.find('.title').hide();
        $newsletter.find('#ofertas').hide();
        {% endif %}

        $('#gmap3').gmap3({
            marker:{
                address: "{{ store.address | escape('js')}}"
            },
            map:{
                options:{
                    zoom: 14
                }
            }
        });
        {% if provinces_json %}
        $('select[name="country"]').change(function() {
            var provinces = {{provinces_json | default('{}') | raw}};
            LS.swapProvinces(provinces[$(this).val()]);
        }).change();
        {% endif %}

        $("#calculate-shipping-button").click(function(e) {
            e.preventDefault();
            LS.calculateShipping($("#shipping-zipcode").val(), '{{store.shipping_calculator_url | escape('js')}}' );
        });

    });
</script>
<script type="text/javascript">
    $(document).ready(function(){
        $('.sort-by').change(function(){
            var params = LS.urlParams;
            params['sort_by'] = $(this).val();
            var sort_params_array = [];
            for (var key in params) {
                if ($.inArray(key, ['results_only', 'page']) == -1) {
                    sort_params_array.push(key + '=' + params[key]);
                }
            }
            var sort_params = sort_params_array.join('&');
            window.location = window.location.pathname + '?' + sort_params;
        });
    });
</script>
{% if settings.infinite_scrolling and (template == 'category' or template == 'search') %}
    <script type="text/javascript">
        $(function() {
            new LS.infiniteScroll({
                afterSetup: function() {
                    $('.crumbPaginationContainer').hide();
                },
                finishData: function() {
                    $('#loadMoreBtn').remove();
                },
                productGridClass: 'product-table',
                bufferPx: 600,
                productsPerPage: 16
            });
        });
    </script>
{% endif %}
{% if template == 'cart' %}
    {{ 'js/jquery.livequery.min.js' | static_url | script_tag }}
    <script type="text/javascript">
        $(document).ready(function(){

            // Key pressed in quantity input
            $(".col-quantity input").keypress(function(e){
                if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
                    return false;
                }
            });

            // Quantity input focus out
            $(".col-quantity input").focusout(function(e){
                var itemID = $(this).attr("data-item-id");
                var itemVAL = $(this).val();
                if(itemVAL==0) {
                    var r = confirm("{{ '¿Seguro que quieres borrar este artículo?' | translate }}");
                    if (r == true) {
                        LS.removeItem(itemID);
                    } else {
                        $(this).val(1);
                    }
                } else {
                    LS.changeQuantity(itemID, itemVAL);
                }
            });

            // Clicked shipping method listener
            $(document).on( "click", "input.shipping-method", function() {
                var shippingPrice = $(this).attr("data-price");
                $(this).click(function() {
                    LS.addToTotal(shippingPrice);
                });
            });

            // Default shipping method listener
            $('input.shipping-method:checked').livequery(function(){
                var shippingPrice = $(this).attr("data-price");
                LS.addToTotal(shippingPrice);
            });

        });
    </script>
{% endif %}
<script type="text/javascript">
    $(document).ready(function() {
        var maxHeight = 0;
        $('.wrap-banner, .wrap-banner-services').each(function () {
            maxHeight = $(this).height() > maxHeight ? $(this).height() : maxHeight;
        });
        $('.wrap-banner, .wrap-banner-services').css("height", maxHeight);
    });
</script>

<script type="text/javascript">
    $(document).ready(function(){
        LS.registerOnChangeVariant(function(variant){
            // this is used on quick shop modals
            var current_image = $('img', '.quick-content[data-product="'+variant.product_id+'"]');
            current_image.attr('src', variant.image_url);
            // this is used on single product view
            $(".cloud-zoom-gallery[data-image="+variant.image+"] > img").click();
        });
        $('#product_form').submit(function(){
            var button = $(this).find(':submit');

            button.attr('disabled', 'disabled');
            if (button.hasClass('cart')){
                button.val('{{ "Agregando..." | translate }}');
            }
        });

    });
</script>
<script type="text/javascript">
    (function($){
        $(window).load(function(){

            $("#my-thumbs-list").mThumbnailScroller({
                axis:"yx",
                type:"click-thumb",
                markup:{ buttonsHTML:{ up:"SVG set 2",down:"SVG set 2",left:"SVG set 2",right:"SVG set 2" } }
            });

            $("#content-2").mThumbnailScroller({
                axis:"yx",
                type:"hover-precise"
            });

        });
    })(jQuery);
</script>
{% if store.live_chat %}
    <!-- begin olark code -->
    <script type='text/javascript'>/*{literal}<![CDATA[*/
        window.olark||(function(c){var f=window,d=document,l=f.location.protocol=="https:"?"https:":"http:",z=c.name,r="load";var nt=function(){f[z]=function(){(a.s=a.s||[]).push(arguments)};var a=f[z]._={},q=c.methods.length;while(q--){(function(n){f[z][n]=function(){f[z]("call",n,arguments)}})(c.methods[q])}a.l=c.loader;a.i=nt;a.p={0:+new Date};a.P=function(u){a.p[u]=new Date-a.p[0]};function s(){a.P(r);f[z](r)}f.addEventListener?f.addEventListener(r,s,false):f.attachEvent("on"+r,s);var ld=function(){function p(hd){hd="head";return["<",hd,"></",hd,"><",i,' onl' + 'oad="var d=',g,";d.getElementsByTagName('head')[0].",j,"(d.",h,"('script')).",k,"='",l,"//",a.l,"'",'"',"></",i,">"].join("")}var i="body",m=d[i];if(!m){return setTimeout(ld,100)}a.P(1);var j="appendChild",h="createElement",k="src",n=d[h]("div"),v=n[j](d[h](z)),b=d[h]("iframe"),g="document",e="domain",o;n.style.display="none";m.insertBefore(n,m.firstChild).id=z;b.frameBorder="0";b.id=z+"-loader";if(/MSIE[ ]+6/.test(navigator.userAgent)){b.src="javascript:false"}b.allowTransparency="true";v[j](b);try{b.contentWindow[g].open()}catch(w){c[e]=d[e];o="javascript:var d="+g+".open();d.domain='"+d.domain+"';";b[k]=o+"void(0);"}try{var t=b.contentWindow[g];t.write(p());t.close()}catch(x){b[k]=o+'d.write("'+p().replace(/"/g,String.fromCharCode(92)+'"')+'");d.close();'}a.P(2)};ld()};nt()})({loader: "static.olark.com/jsclient/loader0.js",name:"olark",methods:["configure","extend","declare","identify"]});
        /* custom configuration goes here (www.olark.com/documentation) */
        olark.identify('{{store.live_chat | escape('js')}}');/*]]>{/literal}*/
    </script>
    <!-- end olark code -->
{% endif %}
{{ store.assorted_js | raw }}
</body>
</html>