{% if shipping_calculator_show %}
<div id="shipping-calculator">
    <div id="shipping-calculator-form" {% if shipping_calculator_variant and not shipping_calculator_variant.available %}style="display: none;" {% endif %}>
    <p>{{ "Ingrese aquí su código postal para calcular su costo de envío" | translate }}:</p>
    <p>
	    <input type="text" name="zipcode" id="shipping-zipcode" class="form-control" value="{{ cart.shipping_zipcode }}">
	    {% if shipping_calculator_variant %}
	    <input type="hidden" name="variant_id" id="shipping-variant-id" value="{{ shipping_calculator_variant.id }}">
	    {% endif %}
	    <button id="calculate-shipping-button" class="btn">{{ "Calcular costo de envío" | translate }}</button>
	    <span class="loading" style="display: none;"></span>
	    <p id="invalid-zipcode" style="display: none;">{{ "El código postal es inválido." | translate }}</p>
	</p>
</div>
<div id="shipping-calculator-response" style="display: none;"></div>
</div>
{% endif %}