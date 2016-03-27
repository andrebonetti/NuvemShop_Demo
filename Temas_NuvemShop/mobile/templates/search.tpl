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
		<li>{{ "Busca por" | t }} "{{ query }}" </li>
	</ul>
</nav>

<p class="search-results">
{% if products_count == 0 %}
	{{ "Nenhum produto encontrado" | t }}
{% elseif products_count == 1 %}
	{{ "1 produto encontrado" | t }}
{% else %}
	{{ "{1} produtos encontrados" | t(products_count) }}
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
