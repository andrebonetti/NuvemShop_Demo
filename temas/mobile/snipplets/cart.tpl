{% if cart.items_count > 0 %}
    <h3>
    {% if cart.items_count == 1 %}
        {{ "1 item no carrinho" | t }} - {{ cart.total | money }}
    {% else %}
        {{ "{1} itens no carrinho" | t(cart.items_count ) }} - {{ cart.total | money }}
    {% endif %}
    </h3>
    <ul class="overthrow">
        {% for item in cart.items %}
        <li>
            <a href="{{ item.url }}">{{ item.featured_image | product_image_url("thumb") | img_tag(item.featured_image.alt) }}</a>
            <p>
                <span class="cart-name">{{ item.name }}</span>
                <span class="cart-quantity">{{ "Quantidade: {1}" | t(item.quantity) }}</span>
                <span class="cart-value">{{ "Total: {1}" | t(item.subtotal | money) }}</span>
            </p>
        </li>
        {% endfor %}
    </ul>

    <a href="{{ store.cart_url }}" class="primary-btn">{{ 'Alterar ou finalizar minha compra' | t }}</a>
{% else %}
    <p class="empty">{{ 'Nenhum item no carrinho' | t }}</p>
{% endif %}