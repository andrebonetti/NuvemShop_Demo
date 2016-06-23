<!-- META TAGS -->
            <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
            <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
            <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1">
        
        
        <!-- TITLE + DESCRIPTIONS -->
            <title>{{ page_title }}</title>
            <link rel="shortcut icon" type="image/x-icon" href="//s3-sa-east-1.amazonaws.com/store-templates/templates/132/369/twig/static/img/Shortcut.png?896040453" title="" >
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