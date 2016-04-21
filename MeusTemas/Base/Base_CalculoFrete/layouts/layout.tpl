<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:fb="http://www.facebook.com/2008/fbml" xmlns:og="http://opengraphprotocol.org/schema/">

    <head>

        {% head_content %}

    </head>

    <body itemscope itemtype="http://schema.org/WebPage" itemid="body">

    {% template_content %}

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

    </body>
    
</html>
