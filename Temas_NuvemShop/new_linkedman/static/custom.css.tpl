{% if not settings.image_borders %}
.dest-gral,
.dest-gral:hover,
.dest-gral .bajada:hover,
.dest-gral:hover .bajada,
#product-listing .product,
#product-listing .product .bajada,
#shoppingCartPage .cart-contents .productrow .col-image img,
#single-product .productContainer .imagecol .imagecolContent,
#single-product .thumbnail-container .single-thumb,
#single-product .productContainer .imagecol .shareDiv{
    border-color:transparent;
}


.dest-gral:hover,
.product:hover .head{
    border-color:#d2d2d2;
}
{% endif %}

body{
    background-color: {{ settings.background_color }};
{% if "default-background.jpg" | has_custom_image %}
    background-image: url( "{{ "default-background.jpg" | static_url }}" );
{% endif %}
}

.cloud-zoom-big {
	background-color: {{ settings.background_color }};
}

#fancybox-wrap {
	background-color: {{ settings.background_color }};
}

#no-logo,
#auth a,
#header .infobox,
#header .infobox a,
#footer,
#footer a{
    color: {{ settings.footer_text }};
}
#no-logo {
    text-transform: capitalize;
    font-weight: bold;
    
}
.sf-menu a, .sf-menu a:visited{
    color: {{ settings.nav_text }};
}

.sf-menu li:hover, .sf-menu li.sfHover,
.sf-menu a:focus, .sf-menu a:hover, .sf-menu a:active{
    color: {{ settings.nav_text_hover }};
}

.sf-menu li.selected a{
    color: {{ settings.nav_text_hover }};
    border-top: 1px solid {{ settings.nav_text_hover }};
    border-bottom: 1px solid {{ settings.nav_text_hover }};
}

.button:hover, .submit_button:hover, #ls_cart_widget .cart-summary:hover, .button:hover, .submit_button:hover, #newsletter input.btn:hover, button#calculate-shipping-button:hover, .button.continue-buying:hover, .submit_button.contact:hover, .btn:hover {
    opacity: 0.8;
}

#navigation,
.sf-menu li{
    background-color: {{ settings.nav_background }};
}

#navigation{
    border-top: 1px solid {{ settings.nav_border }};
    border-bottom: 1px solid {{ settings.nav_border }};
}

.sf-menu ul{
    border: 1px solid {{ settings.nav_border }};
    background-color:{{ settings.nav_background }};
}

.sf-menu li.selected ul li a{
    color: {{ settings.nav_text }};
}

.sf-menu li.selected ul li a:hover {
    color: {{ settings.nav_text_hover }};
}

#ls_cart_widget .cart-summary, .button, .submit_button, #newsletter input.btn, button#calculate-shipping-button, .button.continue-buying, .submit_button.contact, .contact_form .submit_button, .contact_form .field input.submit_button {
    background-color: {{ settings.button_secondary_bg }};
    background: {{ settings.button_secondary_bg }};
    color: {{ settings.button_color}}
}

#button-installments {
    color: {{ settings.text_color }};
    background: none;
    text-decoration: underline;
}

.button:hover, .submit_button:hover {
    background-color: {{ settings.nav_cart_hover }};
}

#wrapper-foot,
.dest-gral .head .offer,
.dest-gral .head .out-of-stock,
.dest-gral .head .product-details-overlay,
#newsletter input[type="news"], #newsletter input[type="text"] {
    background-color: {{ settings.footer_bg }};
}
#newsletter input[type="news"], #newsletter input[type="text"] {
    border: 1px solid {{ settings.actual_footer_text }};
    color: {{ settings.actual_footer_text }};
}
#wrapper-foot {
    color: {{ settings.actual_footer_text }};
}
.product-details-overlay span:hover {
    color: {{ settings.actual_footer_text }};
}
.button,
.submit_button,
.dest-gral .head .free-shipping {
    background-color: {{ settings.button_bg }}
}
.headerBox{
    color: {{ settings.title_color }};
    background-color: {{ settings.title_background }};
    border-color: {{ settings.content_border }};
}

.headerBox h2, .headerBox-Page h2, .headerBox-List h2,
.headerBox h1, .headerBox-Page h1, .headerBox-List h1{
    color: {{ settings.title_color }};
    font-family: {{ settings.font_headings | raw }}!important;
}
.headerBox-List span {
    color: {{ settings.text_color }};
}

.sf-menu a, .col-foot a {
    font-family: {{ settings.font_navigation | raw }}!important;
}

#wrapper-foot h4,
.col-foot li.phone,
.col-foot li.mail,
.col-foot li.mail a,
.col-foot li.address,
.col-foot li.blog,
.col-foot li.blog a,
.col-foot li a, #newsletter .contact-error, #newsletter .contact-ok,
#wrapper-foot i.fa {
    color: {{ settings.actual_footer_text }};
}

button, select, textarea {
    font-family: {{ settings.font_buttons | raw }}!important;
}

body, .dest-gral .bajada .title, .dest-gral .bajada .title a, .dest-gral .bajada .price, .cart-contents .name, .contact, .contact a, .contact_form .field label, .user-content a.quick, .social-title h1, a, .product-details-overlay span:hover, .product-details-overlay span {
    color: {{ settings.text_color }};
    font-family: {{ settings.font_rest | raw }}!important;
}
.product-details-overlay span:hover, .product-details-overlay span {
    color: {{ settings.actual_footer_text }};
}
.fancybox-skin {
     color: {{ settings.text_color }};
     background: {{ settings.background_color }};
}
.badge {
    color: {{ settings.text_color }};
    background: {{ settings.background_color }};
    font-size: 13px;
}
/* Banner Services */
#banner-services{
    background: {{ settings.background_color }};
}
#banner-services h4{
    font-family: {{ settings.font_headings | raw}};
    color: {{ settings.title_color }};
    font-weight: 500;
}
/* Banner Services */
#banner-services{
    background: {{ settings.background_color }};
}
#banner-services h4{
    font-family: {{ settings.font_headings | raw}};
    color: {{ settings.text_color }};
    font-weight: 500;
}
#banner-services p{
    color: {{ settings.text_color }};
}
#banner-services .span4:not(:last-child), #banner-services .span6:not(:last-child){
    border-right: 1px solid;
    border-color:{{ settings.text_color }};
}
#banner-services .banner-service-item .service-icon{
    color: {{ settings.text_color }};
}
.banner-services-footer{
    background: {{ settings.background_color }};
    border-top: 1px dotted #a0a0a0; 
}
