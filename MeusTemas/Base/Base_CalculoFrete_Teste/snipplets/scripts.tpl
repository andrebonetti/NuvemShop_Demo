{{ "//ajax.googleapis.com/ajax/libs/jqueryui/1.11.0/jquery-ui.min.js" | script_tag }}
{{ 'js/bxslider/jquery.bxslider.min.js' | static_url | script_tag }}
{{ "js/jquery.tipTip.min.js" | static_url | script_tag }}
{{ "js/superfish.js" | static_url | script_tag }}

<script type="text/javascript">
        $(document).ready(function($) {

        LS.registerOnChangeVariant(function(variant){
            $(".cloud-zoom-gallery[data-image="+variant.image+"] > img").click();
        });

    //Navigation sizer
            var $navigation = $("#navigation");
            var $navigation_a = $navigation.find('a');
            var navHeight = parseInt($navigation.css('height', 'auto').height());
            var fontSize = parseInt($navigation_a.css('font-size'));

            while (navHeight > 43 && fontSize > 9){
                $navigation_a.css('font-size', --fontSize);
                navHeight = parseInt($("#navigation").height());
            }

            $("ul.sf-menu").superfish();

            $(".tooltip").tipTip();

            /*
             $("#content .item .data .thumb").hover(function(){
             $(this).find(".primary").fadeOut(200);
             $(this).find(".secondary").fadeIn(200);
             },
             function(){
             $(this).find(".secondary").fadeOut(200);
             $(this).find(".primary").fadeIn(200);
             });
             */

            /* homepage slider parameters */
            $('.home-slider').bxSlider({
                auto: {% if settings.slider_auto and sections.slider.products | length > 1 %}true{% else %}false{% endif %},
                pause: 5000,
                autoHover: true,
                adaptiveHeight: false
            });

            var bxslider = $('.homeslider').bxSlider({
                auto: {% if settings.slider_auto and settings.slider | length > 1 %}true{% else %}false{% endif %},
                pause: 5000,
                autoHover: true,
                adaptiveHeight: false
            });

            // This condition works because in digital you cannot have a product slider and an images slider at the same time.
            {% if (settings.home_display == 'slider' and settings.slider | length == 1) or
                    (settings.home_display == 'products' and sections.slider.products | length == 1) %}
                $('.bx-pager').remove();
            {% endif %}

            {% if provinces_json %}
            $('select[name="country"]').change(function() {
                var provinces = {{provinces_json | default('{}') | raw}};
                LS.swapProvinces(provinces[$(this).val()]);
            }).change();
            {% endif %}

            $(".col-quantity input").keypress(function(){
                $('#change-quantities').show();
            });

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

{% if template == "product" and product.variations %}
            <!-- if template == "product" and product.variations -->   
            <script type="text/javascript">
                function changeVariant(variant){
                    if (variant.price_long){
                        $('#price_display').text(variant.price_long).show();
                    } else {
                        $('#price_display').hide();
                    }

                    if (variant.compare_at_price_long){
                        $('#compare_price_display').text(variant.compare_at_price_long).show();
                    } else {
                        $('#compare_price_display').hide();
                    }

                    if (variant.installments && variant.installments > 1){
                        $('#installments_number').text(variant.installments);
                        $('#installments_amount').text(variant.installments_amount_short);
                        $('.installments').show();
                    } else {
                        $('.installments').hide();
                    }

                    var button = $('#buy input');
                    button.removeClass('cart').removeClass('contact').removeClass('nostock');
                    {% if not store.is_catalog %}
                    if (!variant.available){
                        button.val('{{ "Sin stock" | translate }}');
                        button.addClass('nostock');
                        button.attr('disabled', 'disabled');
                    } else if (variant.contact) {
                        button.val('{{ "Consultar precio" | translate }}');
                        button.addClass('contact');
                        button.removeAttr('disabled');
                    } else {
                        button.val('{{ "Agregar al carrito" | translate }}');
                        button.addClass('cart');
                        button.removeAttr('disabled');
                    }
                    {% endif %}
                }

                $(document).ready(function(){
                    $('#product_form').submit(function(){
                        var button = $(this).find(':submit');

                        button.attr('disabled', 'disabled');
                        if (button.hasClass('cart')){
                            button.val('{{ "Agregando..." | translate }}');
                        }
                    });

                    {% if provinces_json %}
                    $('select[name="country"]').change(function() {
                        var provinces = {{provinces_json | default('{}') | raw}};
                        LS.swapProvinces(provinces[$(this).val()]);
                    }).change();
                    {% endif %}
                });
            </script>
        {% endif %}


        {% if template == "product" %}
            <!-- if template == "product" and product.variations -->
           {{ "jquery-slimbox-2-02.js" | static_url | script_tag }}
        {% endif %}


        <!-- "jquery-theme-1-0.js" | static_url | script_tag \/ -->   
        {{ "jquery-theme-1-0.js" | static_url | script_tag }}
        <!-- 'slider/slider.js' | static_url | script_tag \/ --> 
        {{ 'slider/slider.js' | static_url | script_tag }}


        <script type="text/javascript">
            $(function() {
                $('.nivoSlider').nivoSlider({
                    animSpeed: 250,
                    manualAdvance: {{ settings.slider_auto ? 'false' : 'true' }}
                });
            });

            if({{ settings.slider | length == 1 ? 'true' : 'false' }}) {
                $('.nivo-directionNav, .nivo-controlNav').remove();
            }
        </script>


        {% if settings.infinite_scrolling and (template == 'category' or template == 'search') %}
            <!-- if settings.infinite_scrolling and (template == 'category' or template == 'search') -->
            <script type="text/javascript">
                $(function() {
                    new LS.infiniteScroll({
                        afterSetup: function() {
                            $('#paginate').hide();
                        },
                        productGridClass: 'product-grid'
                    });
                });

            </script>
        {% endif %}


        {% if store.live_chat %}
            <!-- if store.live_chat -->
                <!-- begin olark code --><script type='text/javascript'>/*{literal}<![CDATA[*/
                window.olark||(function(c){var f=window,d=document,l=f.location.protocol=="https:"?"https:":"http:",z=c.name,r="load";var nt=function(){f[z]=function(){(a.s=a.s||[]).push(arguments)};var a=f[z]._={},q=c.methods.length;while(q--){(function(n){f[z][n]=function(){f[z]("call",n,arguments)}})(c.methods[q])}a.l=c.loader;a.i=nt;a.p={0:+new Date};a.P=function(u){a.p[u]=new Date-a.p[0]};function s(){a.P(r);f[z](r)}f.addEventListener?f.addEventListener(r,s,false):f.attachEvent("on"+r,s);var ld=function(){function p(hd){hd="head";return["<",hd,"></",hd,"><",i,' onl' + 'oad="var d=',g,";d.getElementsByTagName('head')[0].",j,"(d.",h,"('script')).",k,"='",l,"//",a.l,"'",'"',"></",i,">"].join("")}var i="body",m=d[i];if(!m){return setTimeout(ld,100)}a.P(1);var j="appendChild",h="createElement",k="src",n=d[h]("div"),v=n[j](d[h](z)),b=d[h]("iframe"),g="document",e="domain",o;n.style.display="none";m.insertBefore(n,m.firstChild).id=z;b.frameBorder="0";b.id=z+"-loader";if(/MSIE[ ]+6/.test(navigator.userAgent)){b.src="javascript:false"}b.allowTransparency="true";v[j](b);try{b.contentWindow[g].open()}catch(w){c[e]=d[e];o="javascript:var d="+g+".open();d.domain='"+d.domain+"';";b[k]=o+"void(0);"}try{var t=b.contentWindow[g];t.write(p());t.close()}catch(x){b[k]=o+'d.write("'+p().replace(/"/g,String.fromCharCode(92)+'"')+'");d.close();'}a.P(2)};ld()};nt()})({loader: "static.olark.com/jsclient/loader0.js",name:"olark",methods:["configure","extend","declare","identify"]});
                /* custom configuration goes here (www.olark.com/documentation) */
                olark.identify('{{store.live_chat | escape('js')}}');/*]]>{/literal}*/</script>
                <!-- end olark code -->
        {% endif %}

        <!-- store.assorted_js | raw \/ -->
        {{ store.assorted_js | raw }}