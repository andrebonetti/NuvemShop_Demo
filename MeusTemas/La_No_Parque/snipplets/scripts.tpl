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