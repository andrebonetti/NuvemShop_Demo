{% set show_sidebar = settings.product_filters %}
{% paginate by 20 %}

{% if "banner-products.jpg" | has_custom_image %}
<div class="row-fluid">
    <div class="banner">
        {% if settings.banner_products_url != '' %}
            {{ "banner-products.jpg" | static_url | img_tag | a_tag(settings.banner_products_url) }}
        {% else %}
            {{ "banner-products.jpg" | static_url | img_tag }}
        {% endif %}
    </div>
</div>
{% endif %}

<div class="row-fluid">
    <div class="headerBox-List">
        <div class="container c">
        	<h1>{{ category.name }}</h1>
        </div>
        <div class="container c">
        	{% snipplet "breadcrumbs.tpl" %}
        </div>
        <div class="container c">
            {% snipplet 'sort_by.tpl' %}
        </div>
    <div class="banner-services-category">
        {% if settings.banner_services_category %} 
             {% include 'snipplets/banner-services.tpl' %}
        {% endif %} 
    </div>
    </div>
</div>
<div class="content-fluid" id="category-page">
    <div class="row-fluid">
        {% if show_sidebar %} 
            {% snipplet 'sidebar.tpl' %}
        {% endif %} 
        <div {% if show_sidebar %}class="span10"{% else %}class="span12"{% endif %}>
        {% if products %}
            <div class="product-table">
                {% snipplet "product_grid.tpl" %}
            </div>
            {% if settings.infinite_scrolling and not pages.is_last %}
            <a id="loadMoreBtn" class="button secondary"><i class="fa fa-circle-o-notch fa-spin loadingSpin"></i>{{ 'Mostrar más productos' | t }}</a>
            {% endif %}
        {% else %}
            <div class="filters-msg">
                {{(has_filters ? "No tenemos productos en esas variantes. Por favor, intentá con otros filtros." : "Próximamente") | translate}}
            </div>
        {% endif %}
        </div>
    </div>

    <div class="row-fluid">
        <div class="span8 offset2">
            <div class="crumbPaginationContainer bottom">
                <div class='pagination'>
                    {% snipplet "pagination.tpl" %}
                </div>
            </div>
         </div>
    </div>
</div>