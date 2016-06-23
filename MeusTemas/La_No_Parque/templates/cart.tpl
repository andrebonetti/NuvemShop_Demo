<div id="shoppingCartPage" data-minimum="{{ settings.cart_minimum_value }}">
    
<section class="carrinho">    
    {% if cart.items %}
             
        <h1>Carrinho de Compras</h1>
		
		{% if error.add %}
			<div class="error">{{ "Desculpe, mas não há estoque suficiente para incluir este produto ao carrinho." | translate }}</div>
		{% endif %}
		{% for error in error.update %}
			<div class="error">{{ "Não podemos te oferecer {1} unidades do produto {2}. No momento, somente possuímos {3} unidades" | translate(error.requested, error.item.name, error.stock) }}</div>
		{% endfor %}
        
        <form id="cart-form" action="" method="post">
            
            <div class="clear"></div>

            <div id="error-ajax-stock" class="container hidden">
                <div class='alert alert-warning alert-dismissible fade in' role='alert'>
                <button type='button' class='close' onclick="jQuery(this).parent().parent().hide();">
                    <span aria-hidden='true'>×</span></button>
                <strong>Error</strong> {{ "Desculpe, mas não há estoque suficiente para incluir este produto ao carrinho." | translate }}
                </div>
            </div>

            <div id="store-curr" class="hidden">{{ store.currency }}</div>
                  
            <table class="table">
                        
                <thead>
                    <tr>
                        <th>Imagem</th>
                        <th class="col-product">Produto</th>
                        <th class="col-quantity">Quantidade</th>
                        <th class="col-price">Preço</th>
                        <th class="col-subtotal">SubTotal</th>
                        <th></th>
                    </tr>
                </thead>
        
			     <input type="hidden" name="mwp_change_quantities" value="1" />
			               
                <tbody>
                    
                    {% for item in cart.items %}
                    
                    <tr data-item-id="{{ item.id }}">
                            
                        <!-- IMAGEM -->
                        <td>
                            <a class="thumb" href="{{ item.url }}">{{ item.featured_image | product_image_url("thumb") | img_tag(item.featured_image.alt) }}</a>
                        </td>
                                
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
			
             <div class="frete_calculator">

                {% snipplet "shipping_cost_calculator.tpl" with shipping_calculator_show = settings.shipping_calculator_cart_page %}

            </div>
            
            <div class="finalizacao_compra">
                        
                <div class='subtotal-price' data-priceraw="{{ cart.total }}">
                {{ "Subtotal" | translate }}: {{ cart.total | money }}
                </div>
                <div class='total-price' data-priceraw="{{ cart.total }}">
                    {{ "Total" | translate }}: {{ cart.total | money }}
                </div>
                
                <div class="fanalizar">

                    {% set cart_total = (settings.cart_minimum_value * 100) %}

                    <a href="{{ store.products_url }}" class="btn btn-primary">{{ 'Seguir comprando' | translate }}</a>

                    {% if cart.total >= cart_total %}
                        <input id="go-to-checkout" class="btn btn-success" type="submit" name="go_to_checkout" value="Finalizar Compra" />
                    {% else %}
                        <h3 class="lessthan pull-right">{{ "O valor mínimo de compra (subtotal) é de" | translate }} <strong>{{ cart_total | money }}</strong></h3>
                    {% endif %}    
                    
                </div>

            </div>
                    
		</form>
        
     

    {% else %}
    
    {% snipplet "sidebar.tpl" %}				
	
        <div id="content" class="single">
            <h2 class="title">{{ (error ? "Desculpe, mas não há estoque suficiente para incluir este produto ao carrinho." : "O carrinho de compras está vazio.") | translate }} <small>{{ "Talvez você se interesse pelos seguintes produtos:" | translate }}</small></h2>
            <div class="listado">
            {% snipplet "product_grid.tpl" with products = sections.slider.products %}
            </div>
            <div class="clear"></div>
        </div><!--content-->
	
    {% endif %}
    
</section>   