{% if options %}
<ul class="shipping-list">
	{% for option in options %}
 	<li>
		<label for="shipping-{{loop.index}}">
            {% if not variant %}
            <div class="span1">
	    	    <input id="shipping-{{loop.index}}" class="shipping-method" data-price="{{option.cost.value}}" type="radio" value="{{option.code}}" {% if loop.first %}checked="checked"{% endif %} name="option" />
	    	</div>
            {% endif %}            
	    	<div class="span2"><img src="{{option.img_code | shipping_logo}}"/></div>
		    <div class="span8">
		    	<h4>{{option.cost}}</h4> 
		    	<span>{{option.name}}</span>
	    	</div>
	    </label>
    </li>
    {% endfor %}
</ul>
{% else %}
<span>{{"No hay costos de envío para el código postal dado." | translate}}</span>
{% endif %}

{# Don't remove this #}
<input type="hidden" name="after_calculation" value="1"/>
<input type="hidden" name="zipcode" value="{{zipcode}}"/>