<div class="container page_detail">
    <div class="path">
        {% snipplet "breadcrumbs.tpl" %}
    </div>
    <div class="clear"></div>
    <div class="titles">
        <h1>{{ page.name }}</h1>
    </div>
    <div class="container">
        {{ page.content }}
    </div>
</div>