<table class="table table-striped">
    <thead>
        <th>Imagem</th>
        <th>Nome</th>
        <th>Categoria</th>
        <th>Estoque</th>
        <th>Preço</th>
    </thead>
    <tbody>
        {% for product in products %}

            {% include 'snipplets/single_product_Search.tpl' %}
            
        {% endfor %}
    </tbody>
</table>