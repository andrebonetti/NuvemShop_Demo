<div id="breadcrumb" itemscope itemtype="http://www.schema.org/WebPage" itemid="body">
    
    <ul class="breadcrumb" itemprop="breadcrumb">
        
        <li> <a href="{{ store.url }}" title="{{ store.name }}">{{ "Inicio" | translate }}</a></li>
    
        {% for crumb in breadcrumbs %}

            {% if crumb.last %}
                <li class="active"><a href="#">{{ crumb.name }}</a></li>
            {% else %}
                <li><a href="{{ crumb.url }}" title="{{ crumb.name }}" >{{ crumb.name }}</a></li>
            {% endif %}
        {% endfor %}
        
    </ul>

</div>