<div class="page-content">
    <div class="headerBox-Page">
        <h2>{{ "Mi cuenta" | translate }}</h2>
    </div>
    {% snipplet "breadcrumbs.tpl" %}
    <div class="container-fluid">
        <div class="customer-box span4">
            <h3>{{ 'Datos Personales' | translate }}</h3>
            <div class="contact-data row-fluid oh">
                <div class="span4">
                    <img class="portrait" src="https://www.gravatar.com/avatar/{{ customer.email | lower | md5 }}?s=80&d=mm" height="80" width="80"/>
                </div>
                <div class="span8">
                    <div>{{customer.name}}</div>
                    <div>{{customer.email}}</div>
                    {% if customer.cpf_cnpj %}
                        <div><strong>{{ 'CPF / CNPJ' | translate }}:</strong> {{ customer.cpf_cnpj | format_cpf_cnpj }}</div>
                    {% endif %}
                    {% if customer.phone %}
                        <div><strong>{{ 'Teléfono' | translate }}:</strong> {{ customer.phone }}</div>
                    {% endif %}
                    <div class="small">{{ 'Editar mis datos' | translate | a_tag(store.customer_info_url) }}</div>
                </div>
            </div>
            {% if customer.default_address %}
                <div class="addresses">
                    <div class="address">
                        {{ customer.default_address | format_address_short }}
                    </div>
                    <div class="small">{{ 'Editar mis direcciones' | translate | a_tag(store.customer_addresses_url) }}</div>
                </div>
            {% endif %}
        </div>
        <div class="order-box span8">
            <h3>{{ 'Mis Órdenes' | translate }}</h3>
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>{{'Orden' | translate}}</th>
                        <th>{{'Fecha' | translate}}</th>
                        <th>{{'Estado' | translate}}</th>
                        <th>{{'Pago' | translate}}</th>
                        <th>{{'Envío' | translate}}</th>
                        <th>{{'Total' | translate}}</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    {% for order in customer.orders %}
                    {% set add_checkout_link = order.pending %}
                    <tr class="{% if order.status == 'open' %}warning{% elseif order.status == 'closed' %}success{% elseif order.status == 'cancelled' %}error{% endif %}">
                        <td data-label="{{'Orden' | translate}}"><a href="{{ store.customer_order_url(order) }}">#{{order.number}}</a></td>
                        <td data-label="{{'Fecha' | translate}}">{{ order.date | i18n_date('%d/%m/%Y') }}</td>
                        <td data-label="{{'Estado' | translate}}">{{ (order.status == 'open'? 'Abierta' : (order.status == 'closed'? 'Cerrada' : 'Cancelada')) | translate }}</td>
                        <td data-label="{{'Pago' | translate}}">{{ (order.payment_status == 'pending'? 'Pendiente' : (order.payment_status == 'authorized'? 'Autorizado' : (order.payment_status == 'paid'? 'Pagado' : (order.payment_status == 'voided'? 'Cancelado' : (order.payment_status == 'refunded'? 'Reintegrado' : 'Abandonado'))))) | translate }}</td>
                        <td data-label="{{'Envío' | translate}}">{{ (order.shipping_status == 'fulfilled'? 'Enviado' : 'No enviado') | translate }}</td>
                        <td data-label="{{'Total' | translate}}" {% if not add_checkout_link %}colspan="2"{% endif %}>{{ order.total | money }}</td>
                        {% if add_checkout_link %}
                            <td><a class="checkout-link" href="{{ order.checkout_url | add_param('ref', 'orders_list') }}" target="_blank">{{'Realizar el pago >' | translate}}</a></td>
                        {% endif %}
                    </tr>
                    {% endfor %}
                </tbody>
            </table>
        </div>
    </div>
</div>