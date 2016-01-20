{% if options %}
<p>{{"Veja os valores para o seu CEP abaixo" | t}}:</p>
<ul class="shipping-list">
	{% for option in options %}
 	<li>
 		<input class="shipping-method" id="shipping-method-{{loop.index}}" data-price="{{option.cost.value}}" type="radio" value="{{option.code}}" {% if loop.first %}checked="checked"{% endif %} name="option" />
		<label for="shipping-method-{{loop.index}}">
	    	<img src="{{option.img_code | shipping_url}}"><span>{{option.name}} - {{option.cost}}</span>
	    </label>
    </li>
    {% endfor %}
</ul>
{% else %}
<span>{{"Não há frete disponível para o CEP informado." | t}}</span>
{% endif %}

{# Don't remove this #}
<input type="hidden" name="after_calculation" value="1"/>
<input type="hidden" name="zipcode" value="{{zipcode}}"/>