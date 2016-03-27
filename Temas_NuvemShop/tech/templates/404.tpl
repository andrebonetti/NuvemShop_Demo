<div class="container">
    <div class="search-result">
        <div class="titles">
            <h1>{{ "La página no existe" | translate }}</h1>
        </div>
        <div class="no-result">
            <p>{{ "La página que estás buscando no existe." | translate }} {{ "Quizás te interesen los siguientes productos." | translate }}</p>
        </div>
        <div class="titles related-title">
            <h1>{{ "Productos destacados" | translate }}</h1>
        </div>
        {% if product.metafields.related_products.html %}
            {{ product.metafields.related_products.html | raw }}
        {% else %}
            <div class="container products">
                {% for product in sections.noresult.products %}
                    {% if loop.index % 4 == 1 %}
                    {% endif %}
                    {% include 'snipplets/single_product.tpl' %}
                    {% if loop.index % 4 == 0 or loop.last %}
                    {% endif %}
                {% endfor %}
            </div>
        {% endif %}
    </div>
</div>