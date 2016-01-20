<nav class="breadcrumb">
	<ul>
		<li><a href="{{ store.products_url }}">&laquo; {{ "Continuar comprando" | t }}</a></li>
	</ul>
</nav>

{% if cart.items %}
<section id="my-cart">
	<h1>{{ "Carrinho de Compras" | t }}</h1>
	{% if error.add %}
		<p class="error">{{ "Desculpe, mas não há estoque suficiente para incluir este produto ao carrinho." | t }}</p>
	{% endif %}
	{% for error in error.update %}
		<p class="error">{{ "Não podemos te oferecer {1} unidades do produto {2}. No momento, somente possuímos {3} unidades" | t(error.requested, error.item.name, error.stock) }}</p>
	{% endfor %}
	<form action="" method="post">
		<input type="hidden" name="mwp_change_quantities" value="1" />
		<section id="cart-products">
			{% for item in cart.items %}
			<article data-price="{{ item.subtotal }}">
				<img src="{{ item.featured_image | product_image_url('thumb')}}" alt="{{ item.featured_image.alt }}">
				<div class="info">
					<p class="name">{{ item.name }}</p>
					<p class="quantity">{{ "Quantidade" | t }}: <em>{{ item.quantity }}</em> (<a href="#" class="change-quantity-btn">{{ "alterar" | t }}</a>)</p>
					<div class="change-quantity hidden">
						<p>{{ "Alterar quantidade para:" | t }}</p>
						<input type="number" name="quantity[{{ item.id }}]" value="{{ item.quantity }}" min="0" pattern="[0-9]*">
						<a href="#" class="secondary-btn close-btn">Ok</a>
					</div>
					<p class="price">{{ item.subtotal | money }}</p>
					<a href="#" class="remove" title="{{ 'Remover' | t }}" aria-hidden="true" data-icon="&#x72;"></a>
				</div>

			</article>
			{% endfor %}
			<p class="total" data-price="{{ cart.total }}"><strong>{{ "Total" | t }}:</strong> {{ cart.total | money }}</p>
		</section>
		{% if settings.shipping_calculator %}
		<section id="shipping-calculator">
			<p>{{ "Digite aqui o seu CEP para calcular o frete" | t }}:</p>
			<input type="text" name="zipcode" id="shipping-zipcode"/>
			<a id="calculate-shipping-btn" href="#">{{ "Calcular Frete" | t }}</a>
			<span class="hidden loading"></span>
			<p class="hidden error" id="invalid-zipcode">{{ "O CEP está inválido." | t }}</p>
		</section>
		{% endif %}
		<section id="cart-actions">
			<input type="submit" id="change-quantities" class="alert-btn hidden" value="{{ 'Atualizar carrinho' | t }}" name="update" />
			<input type="submit" id="checkout-input" class="primary-btn" name="go_to_checkout" value="{{ 'Finalizar compra' | t }}" />
		</section>
	</form>
</section>


<script type="text/javascript">
$(document).ready(function(){
	var shippingClick = function() {
		params = {'zipcode': $("#shipping-zipcode").val()};
		$("#shipping-calculator .loading").show();
		$("#invalid-zipcode").hide();
		$.post('{{store.shipping_calculator_url | escape('js')}}', params, function(data) {
			$("#shipping-calculator .loading").hide();
			if(data.success) {
				$("#shipping-calculator").html(data.html);
			} else {
				$("#invalid-zipcode").show();
			}
		}, 'json');
		return false;
	};
	$("#shipping-calculator input").keypress(function(event){
	    if(event.keyCode == 13){
	        shippingClick;

		    return false;
	    }
	});
	$("#calculate-shipping-btn").click(shippingClick);
	$("#shipping-calculator .loading").hide();

	$(".change-quantity-btn").on("tap", function(){
		$(this).parent().toggle().siblings(".change-quantity").toggleClass('hidden').find('input').focus();

		return false;
	});

	$(".change-quantity .close-btn").on("tap", function(){
		$(this).parent().toggleClass("hidden").siblings('.quantity').show().find('em').text($(this).siblings('input').val());
		//Enable update cart quantities and hide submit button
		$("p.total").hide();
		$("#checkout-input").hide();
		$("#change-quantities").show();

		return false;
	})

	$('article .remove').on('tap', function(){
		$(this).closest('article').fadeOut().find('input').val(0);
		$("p.total").hide();
		$("#checkout-input").hide();
		$("#change-quantities").show();

		return false;
	})
});
</script>
{% else %}			
<h2 class="title">{{ (error ? "Desculpe, mas não há estoque suficiente para incluir este produto ao carrinho." : "O carrinho de compras está vazio.") | t }}</h2>
{% endif %}