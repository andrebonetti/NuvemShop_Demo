{% paginate by 12 %}
<div class="container page">
    <div id="product-listing">
        <div class="headerBox-Page">
            <h2>{{ "Resultados de búsqueda" | translate }}</h2>
        </div>
        {% if products %}
            <hr class="featurette-divider">
            <div class="product-table">
                {% snipplet "product_grid.tpl" %}
            </div>
            {% snipplet "pagination.tpl" %}
        {% else %}
            <p class="alert alert-info"><i class="fa fa-exclamation-triangle"></i>{{ "No hubo resultados para tu búsqueda" | translate }}
            </p>
            <hr class="featurette-divider">
            {% snipplet "maybe_products.tpl" %}
        {% endif %}
    </div>
</div>

 