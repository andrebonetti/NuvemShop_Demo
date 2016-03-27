<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1.0, user-scalable=no" />
    <title>{{ page_title }}</title>
    {% set nojquery = true %}
    {{ '//ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js' | script_tag }}
    {% head_content %}
    {{ 'js/carousel/carousel.css' | static_url | css_tag }}
    {{ 'js/carousel/carousel-style.css' | static_url | css_tag }}
    {{ 'style.css' | static_url | css_tag }}
    <link href='https://fonts.googleapis.com/css?family=Josefin+Slab:600|Open+Sans:300italic,400italic,400,700,300' rel='stylesheet' type='text/css'>
</head>
<body>
{{ social_js }}
    <header id="main-header">
        <h1>
        {% if has_logo %}
            <a id="logo" href="{{ store.url }}" >{{ store.logo | img_tag }}</a>
        {% else %}
            <a id="no-logo" href="{{ store.url }}" >{{ store.name }}</a>
        {% endif %}
        </h1>
        
        <div id="position-saver"></div>
    </header>
    <section id="main" class="template-{{ template }}">
        {% template_content %}  
    </section>

    <footer id="main-footer">
        {% if store.facebook or store.twitter or store.google_plus or store.pinterest or store.instagram %}
        <section id="social">
            <h5>{{ "Junte-se a nós" | t }}</h5>
            <div class="box">
                {% if store.facebook %}
                <a href="{{ store.facebook }}" title="Facebook" target="_blank">{{ "images/logo-face.png" | static_url | img_tag("Facebook") }}</a>
                {% endif %}       

                {% if store.twitter %}
                <a href="{{ store.twitter }}" title="Twitter" target="_blank">{{ "images/logo-twitter.png" | static_url | img_tag("Twitter") }}</a>
                {% endif %}    

                {% if store.google_plus %}
                <a href="{{ store.google_plus }}" title="Google+" target="_blank" rel="publisher">{{ "images/logo-gplus.png" | static_url | img_tag("Google+") }}</a>
                {% endif %}        

                {% if store.pinterest %}
                <a href="{{ store.pinterest }}" title="Pinterest" target="_blank">{{ "images/logo-pinterest.png" | static_url | img_tag("Pinterest") }}</a>
                {% endif %}            

                {% if store.instagram %}
                <a href="{{ store.instagram }}" title="Instagram" target="_blank">{{ "images/logo-instagram.png" | static_url | img_tag("Instagram") }}</a>
                {% endif %}
            </div>      
        </section>
         <hr>
        {% endif %}

        {% if settings.newsletter %}
        <section id="newsletter">
            {% if contact.success %}
            <p class="success">{{ "Obrigado por cadastrar seu e-mail para receber nossas novidades." | t }}</p>
            {% else %}
            <h5>{{ "Assine nossa newsletter" }}</h5>
            <form method="post" action="#newsletter">
                <input type="text" name="name" placeholder="{{ 'Digite seu nome' | t }}">
                <input type="email" name="email" placeholder="{{ 'Digite seu e-mail' | t }}">
                <div class="winnie-pooh">
                  <label for="winnie-pooh-newsletter">{{ "No completar este campo" | t }}</label>
                  <input id="winnie-pooh-newsletter" type="text" name="winnie-pooh"/>
                </div>
                <input type="hidden" name="message" value="Newsletter" />
                <input type="submit" class="submit" value="{{ 'Pedido de inscrição na newsletter' | t}}">
            </form>
            {% endif %}  
        </section>
        <hr>
        {% endif %}

        <section id="security" class="seals" {% if not (ebit or siteforte) %}style="display: none;"{% endif %}>
            <h5>{{ "Segurança e Certificações" | t }}</h5>
            <div class="box">
                {% if ebit %}
                    {{ ebit }}
                {% endif %}
                {% if siteforte %}
                    {{ siteforte }}
                {% endif %} 
            </div>          
         <hr>
         </section>

        {% if settings.shipping %}
        <section id="shipping">
            <h5>{{ "Formas de envio" | t }}</h5>
            <div class="box">
                {% for shipping in settings.shipping %}
                    {{ shipping | shipping_logo | img_tag('', {'height' : 29}) }}
                {% endfor %}
            </div>
        </section>
        <hr>
        {% endif %}
        {% if settings.payments %}  
        <section id="payment">
            <h5>{{ "Formas de pagamento" | t }}</h5>
            <div class="box">
            {% for payment in settings.payments %}
                {{ payment | payment_logo | img_tag('', {'height' : 29}) }}
            {% endfor %}
            </div>
        </section>
        {% endif %}
        <section id="about">
            <p id="copyright">{{ "Copyright {1} {2}. Todos os direitos reservados." | t( "now" | date('Y'), ( store.business_name ? store.business_name : store.name ) ~ ' ' ~ store.business_id ) }}</p>
            <p id="nuvemshop">{{ powered_by_link }}</p>
        </section>
    </footer>
    <aside id="main-menu" class="main-menu hidden overthrow">
        <h4>{{ "Navegação principal" | t }}</h4>
        <ul>
            {% for item in navigation if not item.subitems %}
                <li class="{{ item.current ? 'selected' : '' }}">
                    <a href="{{ item.url }}" {% if item.url | is_external %}target="_blank"{% endif %} title="{{ item.name }}">{{ item.name }}</a>
                </li>
            {% endfor %}
        </ul>
        
        {% for item in navigation if item.subitems %}
            <h4>{{ item.name }}</h4>
            <ul>
                {% for subitem in item.subitems %}
                    <li class="{{ subitem.current ? 'selected' : '' }}">
                        <a href="{{ subitem.url }}" {% if subitem.url | is_external %}target="_blank"{% endif %} title="{{ subitem.name }}">{{ subitem.name }}</a>
                    </li>
                {% endfor %}
            </ul>
        {% endfor %}
    </aside>
    <nav id="main-nav">
        <a href="#" id="main-nav-btn" title="{{ 'Navegação' | t }}" ><span aria-hidden="true" data-icon="&#x6d;"></span></a>
        <ul>
            {% if languages | length > 1 %}
            <li>
                {% for language in languages %}
                    {% if language.active %}
                        <a  id="btn-languages" href="#" title="{{ 'Language' | t }}" aria-hidden="true" data-icon="">
                            {{ language.country | flag_url | img_tag(language.name) }}
                            <span class="caret"></span>
                        </a>
                    {% endif %}
                {% endfor %}
            </li>
           {% endif %}
            <li><a id="btn-search" href="#" title="{{ 'Buscar' | t }}" aria-hidden="true" data-icon="&#x73;"></a></li>
            {% if store.has_accounts %}        
            <li><a id="btn-user" href="#" title="{{ 'Usuário' | t }}" aria-hidden="true" data-icon="&#x75;"></a></li>
            {% endif %}
            {% if not store.is_catalog %}
            <li><a id="btn-cart" href="#" title="{{ 'Carrinho' | t }}" aria-hidden="true" data-icon="&#x63;">
                {% if cart.items_count > 0 %}<span class="cart-count">{{ cart.items_count }}</span>{% endif %}</a></li>
            {% endif %}
        </ul>
        <a id="menu-trigger" class="hidden" href="#">a</a>
         {% if languages | length > 1 %}
        <section id="languages-nav" class="popover hidden">
            <span class="arrow-up"></span>
            <ul>
                {% for language in languages %}
                    <li role="presentation">
                        <a role="menuitem" tabindex="-1" href="{{ language.url }}" class="{{ class }}">
                            {{ language.country | flag_url | img_tag(language.name) }}<span>&nbsp{{ language.name }}</span>
                        </a>
                    </li>
                {% endfor %}
            </ul>
        </section>
        {% endif %}
        <section id="search-nav" class="popover hidden">
            <span class="arrow-up"></span>
            <form action="{{ store.search_url }}" method="get">
                <input id="search-input" type="search" class="search-input" placeholder="{{ 'Buscar produtos' | t }}" name="q">
            </form>
        </section>
        {% if store.has_accounts %}
        <section id="user-nav" class="popover hidden">
            <span class="arrow-up"></span>
            <ul>
            {% if not customer %}
                <li>{{ "Login" | t | a_tag(store.customer_login_url) }}</li>
                {% if 'mandatory' not in store.customer_accounts %}
                <li>{{ "Cadastre-se " | t | a_tag(store.customer_register_url) }}</li>
                {% endif %}
            {% else %}
                <li>{{ "Minha conta" | t | a_tag(store.customer_home_url) }}</li>
                <li>{{ "Sair" | t | a_tag(store.customer_logout_url) }}</li>
            {% endif %}
            </ul>
        </section>
        {% endif %}
        <section id="cart-nav" class="popover hidden"> 
            <span class="arrow-up"></span>
            {% snipplet "cart.tpl" as "cart" %}
        </section>
    </nav>
{{ 'js/jquery.mobile.custom.min.js' | static_url | script_tag}}
{{ 'js/carousel/carousel.js' | static_url | script_tag }}
{{ 'js/jquery.jpanelmenu.js' | static_url | script_tag}}
{{ 'js/overthrow.js' | static_url | script_tag}}
<script type="text/javascript">
    function changeVariant(variant){
        var parent = $("body");
        if (variant.element){
            parent = $(variant.element);
        }

        var sku = parent.find('#sku');
        if(sku.length) {
            sku.text(variant.sku).show();
        }

        if (variant.price_long){
            parent.find('#price .price').text(variant.price_short).show();
        } else {
            parent.find('#price .price').hide();
        }

        if (variant.compare_at_price_long){
            parent.find('#price .compare-price').text(variant.compare_at_price_short).show();
        } else {
            parent.find('#price .compare-price').hide();
        }

        if (variant.installments && variant.installments > 1){
            parent.find('#installments_number').text(variant.installments);
            parent.find('#installments_amount').text(variant.installments_amount_short);
            parent.find('.installments').show();
        } else {
            parent.find('.installments').hide();
        }

        var button = $('.addToCart');
        button.removeClass('cart').removeClass('contact').removeClass('nostock');
        {% if not store.is_catalog %}
        if (!variant.available){
            button.val('{{ "Esgotado" | translate }}');
            button.addClass('nostock');
            button.attr('disabled', 'disabled');
        } else if (variant.contact) {
            button.val('{{ "Preço sob Consulta" | translate }}');
            button.addClass('contact');
            button.removeAttr('disabled');
        } else {
            button.val('{{ "Comprar" | translate }}');
            button.addClass('cart');
            button.removeAttr('disabled');
        }
        {% endif %}
    }

    function togglePopover(trigger, obj) {
        $(trigger).on('tap', function(){
            $.each($(".popover"), function(index, item){
                if($(item).attr('id') == $(obj).attr('id')) {
                    $(obj).toggleClass('hidden');
                    if(obj == "#search-nav")
                    {
                        $("#search-input").focus();
                    }
                }
                else {
                    $(item).addClass('hidden');
                }

            });
            return false;
        });
    }
    var jPM = $.jPanelMenu({
        menu: '#main-menu',
        trigger: '#main-nav-btn',
        excludedPanelContent: '#main-nav, style, script',
        animated: false,
        beforeOpen: function(){$("#main-nav-btn").addClass('down'); $(".popover").addClass('hidden')},
        beforeClose: function(){$("#main-nav-btn").removeClass('down'); $(".popover").addClass('hidden')}
    });

    $(function() {
        $('.m-carousel').carousel();
        togglePopover("#btn-search", "#search-nav");
        togglePopover("#btn-user", "#user-nav");
         togglePopover("#btn-languages", "#languages-nav");
        {% if not store.is_catalog %}
        togglePopover("#btn-cart", "#cart-nav");
        {% endif %}
        jPM.on();

        {% if provinces_json %}
        $('select[name="country"]').change(function() {
            var provinces = {{provinces_json | default('{}') | raw}};
            LS.swapProvinces(provinces[$(this).val()]);
        }).change();
        {% endif %}
    });
</script>
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
