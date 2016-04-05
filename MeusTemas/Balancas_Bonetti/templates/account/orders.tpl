<!-- ORDERS -->

<section class="conta">
    
        <h1>Minha Conta</h1>
        
        <div class="meus-pedidos">
            
            <h2>Meus Pedidos</h2>
            
            <table class="table">
                
                <tr>
                    <th>Pedido</th>
                    <th>Data</th>
                    <th>Estado</th>
                    <th>Pagamento</th>
                    <th>Frete</th>
                    <th>Total</th>
                </tr>
                 
                
                {% for order in customer.orders %} {% set add_checkout_link = order.pending %}
                    <tr class="{% if order.status == 'open' %}warning{% elseif order.status == 'closed' %}success{% elseif order.status == 'cancelled' %}error{% endif %}">
                        <td data-label="{{'Orden' | translate}}"><a href="{{ store.customer_order_url(order) }}">#{{order.number}}</a>
                        </td>
                        <td data-label="{{'Fecha' | translate}}">{{ order.date | i18n_date('%d/%m/%Y') }}</td>
                        <td data-label="{{'Estado' | translate}}">{{ (order.status == 'open'? 'Abierta' : (order.status == 'closed'? 'Cerrada' : 'Cancelada')) | translate }}</td>
                        <td data-label="{{'Pago' | translate}}">{{ (order.payment_status == 'pending'? 'Pendiente' : (order.payment_status == 'authorized'? 'Autorizado' : (order.payment_status == 'paid'? 'Pagado' : (order.payment_status == 'voided'? 'Cancelado' : (order.payment_status == 'refunded'? 'Reintegrado' : 'Abandonado'))))) | translate }}</td>
                        <td data-label="{{'Envío' | translate}}">{{ (order.shipping_status == 'fulfilled'? 'Enviado' : 'No enviado') | translate }}</td>
                        <td data-label="{{'Total' | translate}}" {% if not add_checkout_link %}colspan="2" {% endif %}>{{ order.total | money }}</td>
                        {% if add_checkout_link %}
                        <td><a class="checkout-link" href="{{ order.checkout_url | add_param('ref', 'orders_list') }}" target="_blank">{{'Realizar el pago >' | translate}}</a>
                        </td>
                        {% endif %}
                    </tr>
                {% endfor %}
                
                <tr>
                    <td>123456</td>
                    <td>10/03/2016</td>
                    <td>Em Andamento</td>
                    <td>R$89,90</td>
                    <td>R$15,00</td>
                    <td>R$104,90</td>
                <tr>
                    
                </tr>
                
            </table>
            
        </div>    
        
        <aside>
            
            <div class="dados-pessoais">
                
                <h2>Dados Pessoais</h2>
                
                <img class="portrait" src="https://www.gravatar.com/avatar/{{ customer.email | lower | md5 }}?s=80&d=mm" height="80" width="80" />
                
                <p>{{customer.name}}</p>
                <p>{{customer.email}}</p>
                
                {% if customer.cpf_cnpj %}
                    <p>{{ customer.cpf_cnpj | format_cpf_cnpj }}</p>
                {% endif %}
                
                {% if customer.phone %}
                    <p>{{ customer.phone }}</p>
                {% endif %}
                
                {{ "Editar meu Cadastro" | a_tag(store.customer_info_url) }}
                
            </div>    
            
        </aside>
        
    </section>    