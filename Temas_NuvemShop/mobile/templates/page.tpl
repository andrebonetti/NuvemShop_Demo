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
		<li>{{ page.name }}</li>
	</ul>
</nav>
<section id="page">
	<h1>{{ page.name }}</h1>
	<section id="page-content">
		{{ page.content }}
	</section>
</section>