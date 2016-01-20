<div class="cart-summary">
    {{ "images/cart.png" | static_url | img_tag }}

    {% if cart.items_count > 0 %}
            <a href="{{ store.cart_url }}">{{ "Carrito" | translate }} {{ "({1})" | translate(cart.items_count ) }} - {{ cart.total | money }}</a>

    {% else %}
        <span>{{ "Carrito" | translate }} (0)</span>
    {% endif %}
</div>