{% paginate by 25 %}

<section class="search">
    
    <h1>Resultado da Busca</h1>
    
    {% if products %}
        
        {% snipplet "table_produtos_search.tpl" %}
            
    {% else %}

        <p class="alert alert-warning">Não há resultados para a sua busca</p>

    {% endif %}

</section>