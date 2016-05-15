{% if shipping_calculator_show %}

    <div id="shipping-calculator">
        
        <div id="shipping-calculator-form" {% if shipping_calculator_variant and not shipping_calculator_variant.available %}style="display: none;" {% endif %}>
            
            <p class="calcule-text">Digite aqui o seu CEP para calcular o frete</p>
            
            <input type="text" name="zipcode" id="shipping-zipcode" class="form-control" value="{{ cart.shipping_zipcode }}">
                
            <button id="calculate-shipping-button" class="btn btn-primary">Calcular Frete</button>
            
            <p id="invalid-zipcode" class="alert alert-warning" style="display: none;">O CEP está inválido.</p>
            
        </div>

        <div id="shipping-calculator-response" style="display: none;"></div>

    </div>

{% endif %}