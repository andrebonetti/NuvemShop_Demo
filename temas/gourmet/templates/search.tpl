{% snipplet "banner_products.tpl" %}
{% paginate by 12 %}
<div class="container">
    <div class="contenido">
        <ol class="breadcrumb">{% snipplet "breadcrumbs.tpl" %}</ol>
        <h1>{{ "Resultados de búsqueda" | translate }}</h1>
        {% if products %}
            <div class='productos'>
                {% snipplet "product_grid.tpl" %}
            </div>
            {% snipplet "pagination.tpl" %}
        {% else %}
            <p class="alert alert-info" style='margin-top:30px;'><i class="fa fa-exclamation-triangle"
                                           style="margin-right:10px;"></i>{{ "No hubo resultados para tu búsqueda" | translate }}
            </p>
            {% snipplet "maybe_products.tpl" %}
        {% endif %}
    </div>
</div>

 