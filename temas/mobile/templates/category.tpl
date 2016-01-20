<nav class="breadcrumb">
	<ul>
		<li><a href="{{ store.url }}" class="home" title="{{ store.name }}">{{ store.name }}</a></li>
	{% for crumb in breadcrumbs %}
		{% if crumb.last %}
		<li>{{ crumb.name }}</li>
		{% else %}
		<li><a href="{{ crumb.url }}">{{ crumb.name }}</a></li>
		{% endif %}
	{% endfor %}
	</ul>
</nav>
{% if category.subcategories %}
<section id="subcategories">
	<label for="subcategories-selector">{{ 'Sub-categorias:' | t }}</label>
	<select id="subcategories-selector">
		<option value="">{{ "Selecione..." | t }}</option>
		{% for cat in category.subcategories %}
			<option value="{{ cat.url }}">{{ cat.name }}</option>
		{% endfor %}
	</select>
</section>
{% endif %}

<p class="search-results">
{% if category.products_count == 0 %}
	{{ "Nenhum produto encontrado" | t}}
{% elseif category.products_count == 1 %}
	{{ "1 produto encontrado" | t }}
{% else %}
	{{ "{1} produtos encontrados" | t(category.products_count) }}
{% endif %}
</p>

{% paginate by 9 %}
<section class="products-list">
	{% snipplet "products.tpl" %}
</section>

{% if pages.amount > 1 %}
<section class="pagination">
	{% snipplet "pagination.tpl" %}
</section>
{% endif %}

<script type="text/javascript">
    $(document).ready(function() {
        $("#subcategories-selector").change(function() {
            if($(this).find("option:selected") != "")
            {
                window.location = $(this).find("option:selected").val();
            }
        });
    })
</script>