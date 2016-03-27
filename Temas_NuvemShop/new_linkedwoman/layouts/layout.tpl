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

    {{ 'slider/slider.css' | static_url | css_tag }}
    {{ 'fancybox/jquery.fancybox.css' | static_url | css_tag }}
	
    {{ 'bootstrap.css' | static_url | css_tag }}
    {{ 'bootstrap-responsive.css' | static_url | css_tag }}
    {{ '//netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.css' | css_tag }}
    {{ 'style.css' | static_url | css_tag }}
	{{ 'custom.css.tpl' | static_url | css_tag }}
    {{ 'main-color.scss.tpl' | static_url | css_tag }}
	{{ '//fonts.googleapis.com/css?family=Open+Sans+Condensed:300,300italic,700' | css_tag }}
	
	{% set nojquery = true %}
    {{ '//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js' | script_tag }}
    {% head_content %}
    {{ 'js/bxslider/jquery.bxslider.css' | static_url | css_tag }}
	
	<!--[if lte IE 7]>
		{{ "ie.css" | static_url | css_tag }}
	<![endif]-->
    <!--[if lt IE 9]>
        {{ "html5shiv-printshiv.js" | static_url | script_tag }}
    <![endif]-->

    <style>
        {{ settings.css_code }}
    </style>
</head>
<body itemscope itemtype="http://schema.org/WebPage" itemid="body">
{{ social_js }}
{% if template == 'account.login' or template == 'account.register' %}
<script>
    function loginFacebook() {
        LS.facebookLogin(FB, function(status, hasEmail) {
            if (status === 'connected') {
                if (hasEmail) {
                    window.location = "{{ store.url }}/account/facebook_login/";
                } else {
                    $('#login-form').prepend(
                            "<div class=\"st error c\">{{ 'Tienes que compartír tu e-mail.' | translate }}</div>");
                }
            } else {
                $('#login-form').prepend(
                        "<div class=\"st error c\">{{ 'Debes completar el login.' | translate }}</div>");
            }
        });
    }
</script>
{% endif %}
{{back_to_admin}}
<div class="container">
    <div class="row-fluid">
        <div class="span3">
            <div class="searchbox">
                <form action="{{ store.search_url }}" method="get">
                    <input class="text-input" type="text" name="q" placeholder="{{ 'Buscar' | translate }}"/>
                    <input class="submit-button" type="submit" value=""/>
                </form>
            </div>
        </div>
        <div class="span6">
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
                <h1>
                    <div id="logo">
                        <a id="no-logo" href="{{ store.url }}">{{ store.name }}</a>
                    </div>
                </h1>
            {% endif %}
        </div>
        <div class="span3">
            {% if languages | length > 1 %}
                <div class="languages">
                    {% for language in languages %}
                        {% set class = language.active ? "active" : "" %}
                        <a href="{{ language.url }}" class="{{ class }}">{{ language.country | flag_url | img_tag(language.name) }}</a>
                    {% endfor %}
                </div>
            {% endif %}
            {% if not store.is_catalog %}
            {% snipplet "cart.tpl" as "cart" %}
            {% endif %}
            {% if store.has_accounts %}
                <div id="auth">
                    {% if not customer %}
                        {% if 'mandatory' not in store.customer_accounts %}
                        {{ "Crear cuenta" | translate | a_tag(store.customer_register_url) }}
                        {% endif %}
                        {{ "Iniciar sesión" | translate | a_tag(store.customer_login_url) }}
                    {% else %}
                        {{ "Mi cuenta" | translate | a_tag(store.customer_home_url) }}
                        {{ "Cerrar sesión" | translate | a_tag(store.customer_logout_url) }}
                    {% endif %}
                </div>
            {% endif %}
        </div>
    </div>
    <div id="navigation">
        <ul id="menu" class="sf-menu">
            {% snipplet "navigation.tpl" %}
        </ul>
        <nav class="mobile">
            <select name="main_navigation" id="main_navigation" onchange="location = this.options[this.selectedIndex].value;">
                {% snipplet "navigation-mobile.tpl" %}
            </select>
        </nav>
    </div>
    {% template_content %}
</div>
{% if settings.banner_services %}
<div class="container">
    <div class="banner-services-footer">
         {% include 'snipplets/banner-services.tpl' %}
     </div>
 </div>    
{% endif %}
<div id="wrapper-foot">
    <div class="container">
        <div class="row-fluid">
            {% set has_shipping_logos = settings.shipping %}
            {% set has_payment_logos = settings.payments %}
            {% set has_shipping_payment_logos = has_payment_logos or has_shipping_logos %}
            <div class="span{{ has_shipping_payment_logos ? 2 : 3 }}">
                <div class="col-foot">
                    <h4>{{ "Navegación" | translate }}</h4>
                    {% snipplet "navigation-foot.tpl" %}
                </div>
            </div>
            <div class="span{{ has_shipping_payment_logos ? 2 : 3 }}">
                <div class="col-foot">
                    <h4>{{ "Redes Sociales" | translate }}</h4>
                    {% for sn in ['facebook', 'twitter', 'google_plus', 'pinterest', 'instagram'] %}
                        {% set sn_url = attribute(store,sn) %}
                        {% if sn_url %}
                            <a href="{{ sn_url }}" target="_blank" {% if sn == 'google_plus' %}rel="publisher"{% endif %}><i class="fa fa-{{ sn }}"></i></a>
                        {% endif %}
                    {% endfor %}
                </div>
                <div class="col-foot">
                    <h4>{{ settings.news_message }}</h4>
                    {% snipplet "newsletter.tpl" %}
                </div>
            </div>
            {% if has_shipping_payment_logos %}
                <div class="span3">
                    {% if has_payment_logos %}
                        <div class="col-foot">
                            <h4>{{ "Medios de pago" | translate }}</h4>
                            {% for payment in settings.payments %}
                                {{ payment | payment_logo | img_tag('', {'height' : 20}) }}
                            {% endfor %}
                        </div>
                    {% endif %}
                    {% if has_shipping_logos %}
                        <div class="col-foot">
                            <h4>{{ "Formas de envío" | translate }}</h4>
                            {% for shipping in settings.shipping %}
                                {{ shipping | shipping_logo | img_tag('', {'height' : 20}) }}
                            {% endfor %}
                        </div>
                    {% endif %}
                </div>
            {% endif %}
            <div class="span3">
                <div class="col-foot contact-data">
                    <h4>{{ "Contactanos" | translate }}</h4>
                    {% if store.phone %}
                        <li><i class="fa fa-phone"></i>{{ store.phone }}</li>
                    {% endif %}
                    {% if store.email %}
                        <li><i class="fa fa-envelope"></i>{{ store.email | mailto }}</li>
                    {% endif %}
                    {% if store.blog %}
                        <li><i class="fa fa-comments"></i><a target="_blank" href="{{ store.blog }}">{{ "Visita nuestro Blog!" | translate }}</a></li>
                    {% endif %}
                    {% if store.address %}
                        <li><i class="fa fa-map-marker"></i>{{ store.address }}</li>
                    {% endif %}
                </div>
            </div>
            <div class="span2 seals" {% if not (store.afip or ebit or siteforte) %}style="display: none;"{% endif %}>
                <div class="col-foot">
                    <h4>{{ "Seguridad y Certificaciones" | translate }}</h4>
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
    </div>
</div>
<div id="wrapper-legal">
    <div class="container">
        <div class="row-fluid">
            <div class="span6">
                <div class="powered-by">
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
                    {{ powered_by_link }}
                </div>
            </div>
            <div class="span6">
                <div class="copyright">
                    {{ "Copyright {1} - {2}. Todos los derechos reservados." | translate( (store.business_name ? store.business_name : store.name) ~ (store.business_id ? ' - ' ~ store.business_id : ''), "now" | date('Y') ) }}
                </div>
            </div>
        </div>
    </div>
</div>
{{ '//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js' | script_tag }}
{{ 'hoverIntent.js' | static_url | script_tag }}
{{ 'superfish.js' | static_url | script_tag }}
{{ 'supersubs.js' | static_url | script_tag }}
{{ 'cloud-zoom.1.0.2.min.js' | static_url | script_tag }}
{{ 'js/bxslider/jquery.bxslider.min.js' | static_url | script_tag }}
{{ 'fancybox/jquery.fancybox.pack.js' | static_url | script_tag }}
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

        LS.registerOnChangeVariant(function(variant){
            // this is used on quick shop modals
            var current_image = $('img', '#quick'+variant.product_id);
            current_image.attr('src', variant.image_url);
            // this is used on single product view
            $(".cloud-zoom-gallery[data-image="+variant.image+"] > img").click();
        });

        $('#menu').supersubs({
            minWidth:    8,
            maxWidth:    40,
            extraWidth:  1.3
        }).superfish({
            autoArrows: false,
            dropShadows: false,
            speed: 'fast',
            delay: 500
        });
        
        $('#menu a').bind('touchstart', function(e){
            var li = $(this).parent('li');
            if(li.find('ul a').length > 0){
		        e.preventDefault();
		        
		        if (! li.hasClass('sfHover')){
		            li.showSuperfishUl().siblings().hideSuperfishUl();
		        } else {
		            li.hideSuperfishUl();
		        }
		        
		        return false;
		    }
		});
        
        $('#menu a[href=#]').click(function(e){
            e.preventDefault();
		    return false;
		});

        var bxslider = $('.homeslider').bxSlider({
            auto: {% if settings.slider_auto and settings.slider | length > 1 %}true{% else %}false{% endif %},
            pause: 5000,
            autoHover: true,
            adaptiveHeight: false
        });

        {% if settings.slider | length == 1 %}
            $('.bx-pager').remove();
        {% endif %}
		
		$('#product_form').submit(function(){
			var button = $(this).find(':submit');
		
			button.attr('disabled', 'disabled');
			if (button.hasClass('cart')){
				button.val('{{ "Agregando..." | translate }}');
			}
		});
        $('.fancybox').fancybox();
        {% if contact and contact.success and contact.type == 'newsletter' %}
        $('#newsletter form').hide();
        $('#newsletter .title').hide();
        $('#newsletter #ofertas').hide();
        {% endif %}

        {% if provinces_json %}
        $('select[name="country"]').change(function() {
            var provinces = {{provinces_json | default('{}') | raw}};
            LS.swapProvinces(provinces[$(this).val()]);
        }).change();
        {% endif %}

        $("#calculate-shipping-button").click(function() {
            var params = {'zipcode': $("#shipping-zipcode").val()};
            var variant = $("#shipping-variant-id");
            if(variant.length) {
                params['variant_id'] = variant.val();
            }
            var $shipping_calculator = $("#shipping-calculator");
            var $shipping_calculator_loading = $shipping_calculator.find(".loading");
            $shipping_calculator_loading.show();
            $("#invalid-zipcode").hide();
            $.post('{{store.shipping_calculator_url | escape('js')}}', params, function(data) {
                $shipping_calculator_loading.hide();
                if(data.success) {
                    $("#shipping-calculator-response").html(data.html);
                    $("#shipping-calculator-form, #shipping-calculator-response").toggle();
                } else {
                    $("#invalid-zipcode").show();
                }
            }, 'json');
            return false;
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
                $('.fancybox').fancybox();
            },
            finishData: function() {
                    $('#loadMoreBtn').remove();
                },
            productGridClass: 'product-table',
			productsPerPage: 12
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

{% if template == 'product' %}
{{ "js/jquery-ui-1.8.13.custom.min.js" | static_url | script_tag }}
{{ "js/jquery.thumbnailScroller.js" | static_url | script_tag }}
<script type="text/javascript">
    (function($){
        window.onload=function(){
            $("#tS3").thumbnailScroller({
                scrollerType:"hoverAccelerate",
                scrollerOrientation:"vertical",
                acceleration:0,
                noScrollCenterSpace:100,
                autoScrolling:0,
                autoScrollingSpeed:2000,
                autoScrollingEasing:"easeInOutQuad",
                autoScrollingDelay:500
            });
        }
    })(jQuery);

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

</script>
{% endif %}
{% if store.live_chat %}
<!-- begin olark code --><script type='text/javascript'>/*{literal}<![CDATA[*/
window.olark||(function(c){var f=window,d=document,l=f.location.protocol=="https:"?"https:":"http:",z=c.name,r="load";var nt=function(){f[z]=function(){(a.s=a.s||[]).push(arguments)};var a=f[z]._={},q=c.methods.length;while(q--){(function(n){f[z][n]=function(){f[z]("call",n,arguments)}})(c.methods[q])}a.l=c.loader;a.i=nt;a.p={0:+new Date};a.P=function(u){a.p[u]=new Date-a.p[0]};function s(){a.P(r);f[z](r)}f.addEventListener?f.addEventListener(r,s,false):f.attachEvent("on"+r,s);var ld=function(){function p(hd){hd="head";return["<",hd,"></",hd,"><",i,' onl' + 'oad="var d=',g,";d.getElementsByTagName('head')[0].",j,"(d.",h,"('script')).",k,"='",l,"//",a.l,"'",'"',"></",i,">"].join("")}var i="body",m=d[i];if(!m){return setTimeout(ld,100)}a.P(1);var j="appendChild",h="createElement",k="src",n=d[h]("div"),v=n[j](d[h](z)),b=d[h]("iframe"),g="document",e="domain",o;n.style.display="none";m.insertBefore(n,m.firstChild).id=z;b.frameBorder="0";b.id=z+"-loader";if(/MSIE[ ]+6/.test(navigator.userAgent)){b.src="javascript:false"}b.allowTransparency="true";v[j](b);try{b.contentWindow[g].open()}catch(w){c[e]=d[e];o="javascript:var d="+g+".open();d.domain='"+d.domain+"';";b[k]=o+"void(0);"}try{var t=b.contentWindow[g];t.write(p());t.close()}catch(x){b[k]=o+'d.write("'+p().replace(/"/g,String.fromCharCode(92)+'"')+'");d.close();'}a.P(2)};ld()};nt()})({loader: "static.olark.com/jsclient/loader0.js",name:"olark",methods:["configure","extend","declare","identify"]});
/* custom configuration goes here (www.olark.com/documentation) */
olark.identify('{{store.live_chat | escape('js')}}');/*]]>{/literal}*/</script>
<!-- end olark code -->
{% endif %}
{{ store.assorted_js | raw }}
</body>
</html>
