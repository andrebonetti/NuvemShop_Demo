<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:fb="http://www.facebook.com/2008/fbml" xmlns:og="http://opengraphprotocol.org/schema/">
    <head> 
        
        <!-- META TAGS -->
            <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
            <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
            <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1">
        
        
        <!-- TITLE + DESCRIPTIONS -->
            <title>{{ page_title }}</title>
            <meta name="description" content="{{ page_description }}" />
        
        <!-- IFS -->
            {% if settings.fb_admins %}
                <!-- IF fb:admins == TRUE-->
                <meta property="fb:admins" content="{{ settings.fb_admins }}" />
            {% endif %}

            {% if store_fb_app_id %}
                <!-- IF store_fb_app_id == TRUE -->
                <meta property="fb:app_id" content="{{ store_fb_app_id }}" />
            {% elseif not store.has_custom_domain %}
                <!-- IF fb_app.id == TRUE-->
                <meta property="fb:app_id" content="{{ fb_app.id }}" />
            {% endif %}
        
        <!-- STORE.NAME -->
            {{ store.name | og('site_name') }}
        
        
            {% if template == 'home' and store.logo %}
                <!-- IF TEMPLATE STORE && STORE.LOGO == TRUE-->
                
                {{ ('http:' ~ store.logo) | og('image') }}
                {{ ('https:' ~ store.logo) | og('image:secure_url') }}
            {% endif %}
        
        
            {% if template == 'product' %}
                <!-- IF TEMPLATE PRODUCT == TRUE-->
                
                <!-- TWITTER -->
                {# Twitter #}
                <meta name="twitter:card" content="product" />
                <meta name="twitter:url" content="{{ product.social_url }}" />
                <meta name="twitter:image:src" content="{{ ('http:' ~ product.featured_image | product_image_url('huge')) }}" />
        
                
                {% if store.twitter_user %}
                    <!-- IF TWITTER USER == TRUE -->
        
                    <meta name="twitter:site" content="{{ store.twitter_user }}" />
                {% endif %}
        
                <meta name="twitter:title" content="{{ product.name }}" />
                <meta name="twitter:data1" content="{{ product.display_price ? product.price | money_long : 'Consultar' | translate }}" />
                <meta name="twitter:label1" content="{{ 'Precio' | translate | upper }}" />
                <meta name="twitter:data2" content="{{ product.stock_control ? (product.stock > 0 ? product.stock : 'No' | translate) : 'Si' | translate }}" />
                <meta name="twitter:label2" content="{{ 'Stock' | translate | upper }}" />
                
                <!-- FACEBOOK -->
                {# Facebook #}
        
                <!-- PRODUCT SOCIAL_URL-->
                {{ product.social_url | og('url') }}
        
                <!-- PRODUCT NAME-->
                {{ product.name | og('title') }}
        
                <!-- PAGE DESCRIPTION -->
                {{ page_description | og('description') }}
        
                <!-- fb_app.namespace -->
                {{ "#{fb_app.namespace}:product" | og('type') }}
        
                <!--  og('image') -->
                {{ ('http:' ~ product.featured_image | product_image_url('medium')) | og('image') }}
        
                <!-- image:secure_url -->
                {{ ('https:' ~ product.featured_image | product_image_url('medium')) | og('image:secure_url') }}
        
                {% if product.display_price %}
                    <!-- IF product.display_pric == TRUE-->
        
                    <!-- product.price -->
                    {{ (product.price / 100) | og_fb_app('price') }}
                {% endif %}
                       
                {% if product.stock_control %}
                    <!-- IF product.stock_control TRUE -->
        
                    <!-- product.stock -->
                    {{ product.stock | og_fb_app('stock') }}
                {% endif %}
        
            {% endif %}
        
        <!-- STATIC -->
            
            <!--FONTS-->
            <link href='http://fonts.googleapis.com/css?family=Poppins:600,700|Happy+Monkey' rel='stylesheet' type='text/css'>
            <link href='http://fonts.googleapis.com/css?family=Luckiest+Guy' rel='stylesheet' type='text/css'>
        
            <!-- CSS -->
        
                <!--LIBS-->
                {{ 'css/bootstrap.css' | static_url | css_tag }}
                {{ 'css/bootstrap-responsive.css' | static_url | css_tag }}
                
                <!--NUVEM STYLES-->
                <!--{{ 'js/pushy/pushy.css' | static_url | css_tag }}-->
             
                <!--PLUGINS-->
                {{ 'css/my_jassor.css' | static_url | css_tag }}
        
                <!--MYSTYLE-->
                {{ 'css/style.css' | static_url | css_tag }}
        
            <!--JS-->
            {{ 'js/jquery-2.1.3.min.js' | static_url | script_tag }}
            {{ 'js/bootstrap.js' | static_url | script_tag }}            
            {{ 'js/jssor.js' | static_url | script_tag }}
            {{ 'js/jssor.slider.js' | static_url | script_tag }}
            {{ 'js/my_jassor.js' | static_url | script_tag }}
                
        
            <!-- SET NO JQUERY -->
            {% set nojquery = true %}
        
            <!-- AJAX -->
            {{ "//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js" | script_tag }}
        
        <!-- HEAD CONTENT -->
        
            {% head_content %}
            <!--[if lte IE 7]>
            {{ "css/ie.css" | static_url | css_tag }}
            <![endif]-->
            <!--[if lt IE 9]>
            {{ "js/html5shiv-printshiv.js" | static_url | script_tag }}
            <![endif]-->
    
    </head>
    
    {# Only remove this if you want to take away the theme onboarding advices #}
    {% set show_help = not has_products %}
    
    <body itemscope itemtype="http://schema.org/WebPage" itemid="body">
        
        <div class="logo">
             {{ store.logo  | img_tag(store.name) | a_tag(store.url)}}
        </div>
               
        <div class="myContainer">
            
            <!--SOCIAIS-->
            <div class="sociais">
                
                <div class="social">
                    <a>
                        {{ "img/Face.png" | static_url | img_tag("Facebook La No Parque", {'class' : "link"}) }}
                        {{ "img/Face_hover.png" | static_url | img_tag("Facebook La No Parque", {'class' : "hover"})}}
                    </a>
                </div>
                <div class="social">
                    <a>
                        {{ "img/Instagran.png" | static_url | img_tag("Instagran La No Parque", {'class' : "link"})}}
                        {{ "img/Instagran_hover.png" | static_url | img_tag("Instagran La No Parque", {'class' : "hover"})}}
                    </a>
                </div>
                <div class="social">
                    <a >
                        {{ "img/Twitter.png" | static_url | img_tag("Twitter La No Parque", {'class' : "link"})}}
                        {{ "img/Twitter_hover.png" | static_url | img_tag("Twitter La No Parque", {'class' : "hover"})}}
                    </a>
                </div>
                    
            </div>
            
            <div class="usuario">
                
                {% if not customer %}
                    <!-- if not customer == TRUE -->
                        <!-- Iniciar sesión -->
                        {{ "Iniciar sesión" | translate | a_tag(store.customer_login_url, {'class': 'cadastrar'}) }}
                        {% if 'mandatory' not in store.customer_accounts %}
                            <!-- if not customer == TRUE -->
                            {{ "Crear cuenta" | translate | a_tag(store.customer_register_url, {'class': 'login'}) }}
                        {% endif %}

                    {% else %}
                    <!-- if not customer == FALSE -->

                    {{ "Mi cuenta" | translate | a_tag(store.customer_home_url) }} <span class="divider">-</span>
                    {{ "Cerrar sesión" | translate | a_tag(store.customer_logout_url) }}

                {% endif %}
                
            </div>
            
            <nav class="header">
                <ul id="menu" class="sf-menu hidden-phone">
                    {% snipplet "navigation.tpl" %}
                    <li class="search">
                        <form action="{{ store.search_url }}" method="get">
                            <input class="text-input" type="text" name="q" placeholder="{{ 'buscar' | translate }}"/>
                            <i class="fa fa-search"></i>
                            <input class="submit-search" type="submit" value=""/>
                        </form>
                        <!--<input class="form-control" placeholder="Buscar">
                        <a><img src="img/magnification.png"></a>-->
                    </li>
                </ul>
            </nav>
                     
                <!-- TEMPLATE CONTENT INICIO -->



                {% template_content %}

            
            
                <!-- TEMPLATE CONTENT FIM -->
            <footer>
        	
                <div class="foot">
                    <div class="foot-content">

                        <h5>Navegação</h5>

                        <nav>
                            <ul class="foot-nav">
                                {% snipplet "navigation-foot.tpl" %}
                            </ul>
                        </nav>

                    </div>
                </div>
                
                <div class="foot">
                    <div class="foot-content">

                        <h5>Formas de Pagamento</h5>

                        <h5>Formas de Envio</h5>

                    </div>

                </div>
                <div class="foot">
                    <div class="foot-content">

                        <h5>Contato</h5>

                        <ul class="foot-nav">
                            {% if store.phone %}
                                <li><strong>{{ store.phone }}</strong></li>
                            {% endif %}
                            {% if store.address %}
                                <li>{{ store.address }}</li>
                            {% endif %}
                            {% if store.blog %}
                                <li class="blog"><a target="_blank" href="{{ store.blog }}">{{ store.blog }}</a></li>
                            {% endif %}
                            {% if store.email %}
                                <li class="email">{{ store.email | mailto }}</li>
                            {% endif %}
                        </ul>

                    </div>
                </div>

                <div class="foot">
                    <div class="foot-content">

                        <h5>Social</h5>

                    </div>
                </div>

            </footer>

            <div class="end-page">
                {{ "Copyright {1} - {2}. Todos los derechos reservados." | translate( (store.business_name ? store.business_name : store.name) ~ (store.business_id ? ' - ' ~ store.business_id : ''), "now" | date('Y') ) }}
                <div class="top-page">
                    {{ "Subir" | translate }}
                </div>
            </div>    
            
        </div> 
        
    {{ '//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js' | script_tag }}
    {{ '//ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js' | script_tag }}
    {{ "//maps.googleapis.com/maps/api/js?sensor=false&language=#{current_language.lang}" | script_tag }}
    {{ 'js/luxury.js' | static_url | script_tag }}
    <script type="text/javascript">
    var fancybox_options = {
        padding: 15,
        maxWidth  : "90%",
        fitToView   : false,
        helpers: {
            overlay: {
                locked: false
            }
        }
    };

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
        //Hamburguer Menu Javascript
        $(".mobile-dropdown").click(function(){
            $(this).next("#accordion").slideToggle(300);
            $(this).toggleClass("dropdown-selected");
        });
         $('.homeslider').bxSlider({
            auto: {% if settings.slider_auto and settings.slider | length > 1 %}true{% else %}false{% endif %},
            pause: 5000,
            autoHover: true,
            adaptiveHeight: false,
            nextText:'<i class="fa fa-chevron-right"></i>',
            prevText:'<i class="fa fa-chevron-left"></i>',
        });
        LS.registerOnChangeVariant(function(variant){
            // this is used on quick shop modals
            var current_image = $('img', '.quick-content[data-product="'+variant.product_id+'"]');
            current_image.attr('src', variant.image_url);
            // this is used on single product view
            $(".cloud-zoom-gallery[data-image="+variant.image+"] > img").click();
        });

        $('.top-page').click(function(){
            $("html, body").animate({scrollTop:"0px"});
        });

        $('.goBack').click(function(){
            window.history.back();
        });
        $('#menu').supersubs({
            minWidth:    8,
            maxWidth:    40,
            extraWidth:  1.3
        }).superfish({
            autoArrows: false,
            cssArrows: false,
            dropShadows: false,
            speed: 'fast',
            delay: 500
        });

        $('#menu-slim').supersubs({
            minWidth:    8,
            maxWidth:    40,
            extraWidth:  1.3
        }).superfish({
            autoArrows: false,
            cssArrows: false,
            dropShadows: false,
            speed: 'fast',
            delay: 500
        });

        var headerStart = $("#header").position().top;
        $(window).scroll(function(){
            var position = $(window).scrollTop();

            if(position > headerStart){
                $("#header-slim").stop().animate({  top: 0  }, 500);
            } else {
                $("#header-slim").stop().animate({  top: -140  }, 120);
            }
        });

        $('#product_form').submit(function(){
            var button = $(this).find(':submit');

            button.attr('disabled', 'disabled');
            if (button.hasClass('cart')){
                button.val('{{ "Agregando..." | translate }}');
            }
        });
        var thumbnail_config_horizontal = {
            scrollerType:"clickButtons",
            scrollerOrientation:"horizontal",
            scrollEasing:"easeOutCirc",
            scrollEasingAmount:600,
            acceleration:4,
            scrollSpeed:800,
            noScrollCenterSpace:10,
            autoScrolling:0,
            autoScrollingSpeed:2000,
            autoScrollingEasing:"easeInOutQuad",
            autoScrollingDelay:500
        };
        var thumbnail_config_vertical = $.extend({}, thumbnail_config_horizontal, {scrollerOrientation:"vertical"});
        $("#tS1, #tS2").thumbnailScroller(thumbnail_config_horizontal);
        $("#tS3-recent, #tS3-offer, #tS3-coming").thumbnailScroller(thumbnail_config_vertical);



        $('.quick-content .span6').bxSlider({
              minSlides: 1,
              maxSlides: 1,
              slideMargin: 0
        });

        {% if settings.slider | length == 1 %}
            $('.bx-pager').remove();
        {% endif %}

        $('.fancybox').fancybox(fancybox_options);

        {% if contact and contact.success and contact.type == 'newsletter' %}
        var $newsletter = $('#newsletter');
        $newsletter.find('form').hide();
        $newsletter.find('.title').hide();
        $newsletter.find('#ofertas').hide();
        {% endif %}

        $( ".spinner" ).spinner({
            spin: function( event, ui ) {
                if ( ui.value > 100 ) {
                    $( this ).spinner( "value", 1 );
                    return false;
                } else if ( ui.value < 1 ) {
                    $( this ).spinner( "value", 1 );
                    return false;
                }
            }
        });

        var jTwidth = $( "#tS1 .jTscrollerContainer" ).width();
        $("#tS1 .jTscrollerContainer").css("width", jTwidth + 20 )


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
                    afterLoaded: function() {
                        $('.fancybox').fancybox(fancybox_options);
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
    {% if template == "product" %}
    <script type="text/javascript">
    $(document).ready(function(){
        slider = $('#productbxslider').bxSlider({
            nextText:'<i class="fa fa-chevron-right"></i>',
            prevText:'<i class="fa fa-chevron-left"></i>',

        });
      LS.registerOnChangeVariant(function(variant){
            var liImage = $('#productbxslider').find("[data-image='"+variant.image+"']");
            var selectedPosition = liImage.data('image-position');
            var slideToGo = parseInt(selectedPosition);
            slider.goToSlide(slideToGo);
        });
    });
    </script>
    {% endif %}
    {% if show_help %}
        {% snipplet "defaults/show_help_js.tpl" %}
    {% endif %}
    <script type="text/javascript">
        var maxHeight = 0;
        $('.wrap-banner, .wrap-banner-services').each(function(){
            maxHeight = $(this).height() > maxHeight ? $(this).height() : maxHeight;
            });
        $('.wrap-banner, .wrap-banner-services').css("height", maxHeight);
    </script>
    {% if store.live_chat %}
        <!-- begin olark code --><script type='text/javascript'>/*{literal}<![CDATA[*/
        window.olark||(function(c){var f=window,d=document,l=f.location.protocol=="https:"?"https:":"http:",z=c.name,r="load";var nt=function(){f[z]=function(){(a.s=a.s||[]).push(arguments)};var a=f[z]._={},q=c.methods.length;while(q--){(function(n){f[z][n]=function(){f[z]("call",n,arguments)}})(c.methods[q])}a.l=c.loader;a.i=nt;a.p={0:+new Date};a.P=function(u){a.p[u]=new Date-a.p[0]};function s(){a.P(r);f[z](r)}f.addEventListener?f.addEventListener(r,s,false):f.attachEvent("on"+r,s);var ld=function(){function p(hd){hd="head";return["<",hd,"></",hd,"><",i,' onl' + 'oad="var d=',g,";d.getElementsByTagName('head')[0].",j,"(d.",h,"('script')).",k,"='",l,"//",a.l,"'",'"',"></",i,">"].join("")}var i="body",m=d[i];if(!m){return setTimeout(ld,100)}a.P(1);var j="appendChild",h="createElement",k="src",n=d[h]("div"),v=n[j](d[h](z)),b=d[h]("iframe"),g="document",e="domain",o;n.style.display="none";m.insertBefore(n,m.firstChild).id=z;b.frameBorder="0";b.id=z+"-loader";if(/MSIE[ ]+6/.test(navigator.userAgent)){b.src="javascript:false"}b.allowTransparency="true";v[j](b);try{b.contentWindow[g].open()}catch(w){c[e]=d[e];o="javascript:var d="+g+".open();d.domain='"+d.domain+"';";b[k]=o+"void(0);"}try{var t=b.contentWindow[g];t.write(p());t.close()}catch(x){b[k]=o+'d.write("'+p().replace(/"/g,String.fromCharCode(92)+'"')+'");d.close();'}a.P(2)};ld()};nt()})({loader: "static.olark.com/jsclient/loader0.js",name:"olark",methods:["configure","extend","declare","identify"]});
        /* custom configuration goes here (www.olark.com/documentation) */
        olark.identify('{{store.live_chat | escape('js')}}');/*]]>{/literal}*/
    </script>
        <!-- end olark code -->
    {% endif %}
    {{ store.assorted_js | raw }}
    </body>
</html>
