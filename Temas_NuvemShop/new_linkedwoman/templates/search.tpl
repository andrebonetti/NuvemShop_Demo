{% paginate by 12 %}
<div class="page-content">
	<div id="product-listing">	
		<div class="headerBox-Page">
			<h2>{{ "Resultados de búsqueda" | translate }}</h2>
		</div>

        {% if products %}
         <div class="row-fluid product-table">
            {% snipplet "product_grid.tpl" %}
        </div>
        {% else %}
            <p class="centered st">{{ "No hubo resultados para tu búsqueda" | translate }}</p>
        {% endif %}

        <div class="crumbPaginationContainer bottom">
            <div class='pagination'>
                {% snipplet "pagination.tpl" %}
            </div>
        </div>
    </div>
</div>