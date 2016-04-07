<section class="carrinho">
       
        <h1>Carrinho de Compras</h1>
    
        <div id="shoppingCartPage" data-minimum="{{ settings.cart_minimum_value }}">
               
        {% if cart.items %}
        <!--IF CART ITENS-->    
            
            {% if error.add %}
                <p class="alert alert-warning">Não existe estoque o suficiente deste produto para adicionar ao carrinho</p>
            {% endif %}
            
            {% for error in error.update %}
                <p class="alert alert-warning">{{ "Não podemos oferecer {1} unidades de {2}. Somente temos {3} unidades." | translate(error.requested, error.item.name, error.stock) }}</p>
            {% endfor %}   
            
            <form id="cart-form" action="" method="post">
        
                <table class="table">
            
                    <thead>
                        <tr>
                            <th>Imagem</th>
                            <th>Produto</th>
                            <th>Quantidade</th>
                            <th>Preço</th>
                            <th>SubTotal</th>
                            <th></th>
                        </tr>
                    </thead>
            
                    <tbody>
                                
			             <input type="hidden" name="mwp_change_quantities" value="1" />
                            
                             {% for item in cart.items %}
                                
                                <tr data-item-id="{{ item.id }}">
                                
                                    <!-- IMAGEM -->
                                    <td>

                                        <a class="thumb" href="{{ item.url }}">{{ item.featured_image | product_image_url("thumb") | img_tag(item.featured_image.alt) }}</a>

                                    </td>
                                
                                    <!-- PRODUTO -->
                                    <td><a class="name" href="{{ item.url }}">{{ item.name }}</a></td>    
                                    
                                    <!-- QUANTIDADE -->
                                    <td class="productrow quantidade" data-item-id="{{ item.id }}">

                                            <div class="cant-input quantidade-item">
                                                <input type="text" name="quantity[{{ item.id }}]" value="{{ item.quantity }}" data-item-id="{{ item.id }}" />
                                            </div>
                                        
                                            <div class="cant-ctas botoes-qtde">
                                                <button 
                                                    type="button"
                                                    class="item-plus add-cart hidden-phone" 
                                                    onclick="LS.plusQuantity({{ item.id }})">
                                                    <i class="fa fa-plus"></i>
                                                </button>
                                                <button 
                                                    type="button" 
                                                    class="item-minus remove-cart hidden-phone" 
                                                    onclick="LS.minusQuantity({{ item.id }})">
                                                    <i class="fa fa-minus"></i>
                                                </button>
                                            </div>

                                            <div class="clear"></div>
                                    </td>
                                    
                                    <!-- PREÇO UNITARIO -->
                                    <td>
                                        <span class="price">{{ item.unit_price | money }}</span>
                                    </td>

                                    <!--PRECO TOTAL-->
                                    <td>
                                        <span class="col-subtotal">
                                            <span data-item-variant="{{ item.product.selected_or_first_available_variant.id }}">{{ item.subtotal | money }}</span>
                                        </span>
                                    </td>

                                    <!--DELETAR-->
                                    <td>
                                        <button type="button" class="btn btn-danger cancela-produto" onclick="LS.removeItem({{ item.id }})">X</button>
                                    </td>

                                </tr>        
                            {% endfor %}
                      </tbody> 
                
            </table> 
                
            <div id="error-ajax-stock" class="container hidden">
                        <div class='alert alert-warning alert-dismissible fade in' role='alert'>
                            <button type='button' class='close' onclick="jQuery(this).parent().parent().hide();">
                            <span aria-hidden='true'>×</span></button>
                            <strong>Error</strong> {{ "No hay suficiente stock para agregar este producto al carrito." | translate }}
                        </div>
                    </div>  
                
            <div class="frete_calculator">

                        {% snipplet "shipping_cost_calculator.tpl" with shipping_calculator_show = settings.shipping_calculator_cart_page %}

                        {% if settings.continue_buying %}
                            <a href="{{ store.url }}" class="cart-general-button continue-buying pull-left button">{{ 'Seguir comprando' | translate }}</a>
                        {% endif %}

                    </div>   
                
            <div class="finalizacao_compra">
                        
                        <div class='total-price' data-priceraw="{{ cart.total }}">
                            {{ "Total" | translate }}: {{ cart.total | money }}
                        </div>
                        <!--<div class='sub_total' data-priceraw="{{ cart.total }}">
                            {{ "Subtotal" | translate }}: {{ cart.total | money }}
                        </div>

                        <div class='preco_total' data-priceraw="{{ cart.total }}">
                            {{ "Total" | translate }}: {{ cart.total | money }}
                        </div>-->

                        <div class="fanalizar">

                            {% set cart_total = (settings.cart_minimum_value * 100) %}

                            <a href="{{ store.url }}" class="btn btn-primary">{{ 'Seguir comprando' | translate }}</a>

                            {% if cart.total >= cart_total %}
                                <input id="go-to-checkout" class="btn btn-success" type="submit" name="go_to_checkout" value="Finalizar Compra" />
                            {% else %}
                                <h3 class="lessthan pull-right">{{ "El monto mínimo de compra (subtotal) es de" | translate }} {{ cart_total | money }}</h3>
                            {% endif %}                    
                        </div>

                    </div> 
                
            </form>    

            {% else %}
                <div class="emptyCart centered st">
                    {% if error %}
                        <p class="alert alert-warning">Não existe estoque o suficiente deste produto para adicionar ao carrinho</p>
                    {% else %}
                        <p class="alert alert-info">O Carrinho de Compras está vazio.</p>
                    {% endif %}
                        {{ ("Seguir comprando" | translate ~ " »") | a_tag(store.products_url, {'class' : "btn btn-primary"}) }}
                </div>
            {% endif %}     
        
</section>