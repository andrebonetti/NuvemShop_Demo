{% paginate by 12 %}
<div class="container">
    <div class="search-result">
        <!-- titles -->
        <div class="titles">
            <h1>{{ "Resultados de búsqueda" | translate }}</h1>
        </div>
        <!-- titles -->
        {% if products %}
            <div class="row-fluid product-table">
                {% snipplet "product_grid.tpl" %}
            </div>
        {% else %}
            <div class="no-result">{{ "No hubo resultados para tu búsqueda" | translate }}</div>
            <!-- titles -->
            <div class="titles titles related-title">
                <h1>{{ "Productos destacados" | translate }}</h1>
            </div>
            {% if product.metafields.related_products.html %}
                {{ product.metafields.related_products.html | raw }}
            {% else %}
                <div class="container products">
                    {% for product in sections.noresult.products %}
                        <!-- products -->
                        {% if loop.index % 4 == 1 %}
                        {% endif %}
                        {% include 'snipplets/single_product.tpl' %}
                        {% if loop.index % 4 == 0 or loop.last %}
                        {% endif %}
                    {% endfor %}
                </div>
            {% endif %}
        {% endif %}
        <div class='pagination'>
            {% snipplet "pagination.tpl" %}
        </div>
    </div>
</div>