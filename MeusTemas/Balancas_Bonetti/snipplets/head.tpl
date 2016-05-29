        <title>{{ page_title }}</title>
        <link rel="shortcut icon" type="image/x-icon" href="//s3-sa-east-1.amazonaws.com/store-templates/templates/143/631/twig/static/img/fav_icon_balancas_bonetti.png?1642284368" title="" >
        <meta name="description" content="{{ page_description }}" />
        
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <meta name="description" content="{{ page_description }}" />
        <meta name="copyright" content="{{ store.name }}" />

        {% if settings.fb_admins %}
            <!-- if settings.fb_admins -->
            <meta property="fb:admins" content="{{ settings.fb_admins }}" />
        {% endif %}

        {% if not store.has_custom_domain %}
            <!-- if settings.fb_admins -->
            <meta property="fb:app_id" content="{{ fb_app.id }}" />
        {% endif %}

        <!-- store.name | og('site_name') \/ -->
        {{ store.name | og('site_name') }}

        {% if template == 'home' and store.logo %}
            <!-- if template == 'home' and store.logo -->
            {{ ('http:' ~ store.logo) | og('image') }}
            {{ ('https:' ~ store.logo) | og('image:secure_url') }}
        {% endif %}

        {% if template == 'product' %}
            <!-- if template == 'home' and store.logo -->

            <!-- Twitter \/ -->
            {# Twitter #}
            <meta name="twitter:card" content="product" />
            <meta name="twitter:url" content="{{ product.social_url }}" />
            <meta name="twitter:image:src" content="{{ ('http:' ~ product.featured_image | product_image_url('huge')) }}" /> 
            <meta name="twitter:title" content="{{ product.name }}" />
            <meta name="twitter:data1" content="{{ product.display_price ? product.price | money_long : 'Consultar' | translate }}" />
            <meta name="twitter:label1" content="{{ 'Precio' | translate | upper }}" />
            <meta name="twitter:data2" content="{{ product.stock_control ? (product.stock > 0 ? product.stock : 'No' | translate) : 'Si' | translate }}" />
            <meta name="twitter:label2" content="{{ 'Stock' | translate | upper }}" />

                {% if store.twitter_user %}
                    <!-- if store.twitter_user -->
                    <meta name="twitter:site" content="{{ store.twitter_user }}" />
                {% endif %}

            <!-- Facebook \/ -->
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

        {% head_content %}

        <!------------------------------ CSS ------------------------------>
            <!-- NUVEMSHOP -->
            <!--{{ "screen.css" | static_url | css_tag }}-->
            <!--{{ 'slider/slider.css' | static_url | css_tag }}-->
            <!--{{ "theme.css" | static_url | css_tag }}-->
            <!--{{ "custom.css.tpl" | static_url | css_tag }}-->
            <!--[if lte IE 6]>{{ "ie6.css" | static_url | css_tag }}<![endif]-->
            <!--[if lte IE 7]>{{ "ie7.css" | static_url | css_tag }}<![endif]-->

            <!--LIBS-->
            {{ "css/reset.css" | static_url | css_tag }}
            {{ 'css/bootstrap.css' | static_url | css_tag }}
            {{ 'css/bootstrap-responsive.css' | static_url | css_tag }}
            {{ 'css/jsson.css' | static_url | css_tag }}
                
            <!--MYSTYLE-->
            {{ 'css/style.css' | static_url | css_tag }}

        <!------------------------------ JS ------------------------------>
            <!--LIBS-->
            {{ 'js/jquery-2.1.3.min.js' | static_url | script_tag }}
            {{ 'js/bootstrap.js' | static_url | script_tag }}  

            {{ 'js/Jsson/jssor.js' | static_url | script_tag }} 
            {{ 'js/Jsson/jssor.slider.js' | static_url | script_tag }} 
            {{ 'js/Jsson/jssor.slide_full.js' | static_url | script_tag }} 

        <!--MEUS-->