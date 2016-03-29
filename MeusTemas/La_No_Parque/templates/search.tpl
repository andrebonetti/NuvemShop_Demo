<section class="search">
    
    <h1>{{ "Resultados de búsqueda" | translate }}</h1>
    
    {% if products %}
    
        {% snipplet "product_grid_Search.tpl" %}
            
    {% else %}

        <p class="alert alert-danger">{{ "No hubo resultados para tu búsqueda" | translate }}</p>

    {% endif %}

</section>