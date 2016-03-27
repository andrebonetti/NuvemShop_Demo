{% if options %}
    <p>{{ "Vea las opciones de envío para su código postal abajo" | translate }}:</p>
    <ul class="shipping-list list-unstyled">
        {% for option in options %}
            <li>
                <label for="shipping-{{ loop.index }}">
                    {% if not variant %}
                        <input id="shipping-{{ loop.index }}" class="shipping-method" data-price="{{ option.cost.value }}"
                               type="radio" value="{{ option.code }}" {% if loop.first %}checked="checked"{% endif %}
                               name="option"/>
                    {% endif %}
                    <span><img src="{{ option.img_code | shipping_logo }}"/><span class="shipping-method-name">{{ option.name }} - {{ option.cost }}</span></span>
                </label>
            </li>
        {% endfor %}
    </ul>
{% else %}
    <span>{{ "No hay costos de envío para el código postal dado." | translate }}</span>
{% endif %}

{# Don't remove this #}
<input type="hidden" name="after_calculation" value="1"/>
<input type="hidden" name="zipcode" value="{{ zipcode }}"/>