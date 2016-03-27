<div class="page-content">
    <div class="headerBox-Page">
        <h2>{{ "Mis direcciones" | translate }}</h2>
    </div>
    {% snipplet "breadcrumbs.tpl" %}
    <ul class="addresses container-fluid">
        {% for address in customer.addresses %}
            <li class="ppb span3 offset1">
                <div class="address">{{ address | format_address }}</div>
                <div class="small">
                    {{ 'Editar' | translate | a_tag(store.customer_address_url(address)) }} -
                    {% if address.main %}
                        <strong>{{ 'Principal' | translate }}</strong>
                    {% else %}
                        {{ 'Principal' | translate | a_tag(store.customer_set_main_address_url(address)) }}
                    {% endif %}
                </div>
            </li>
        {% endfor %}
    </ul>
    <div class="clear sst ssb c">
        {{ 'Agregar una nueva dirección' | translate | a_tag(store.customer_new_address_url, { class : 'btn' }) }}
    </div>
</div>
