<table class="table table-striped">
    
    <thead>
        
        <tr>
            <th>Imagem</th>
            <th>Nome</th>
            <th>Categoria</th>
            <th>Estoque</th>
            <th>Preço</th>
        </tr>
        
    </thead>
    
    <tbody>
        
        {% for product in products %}
        
            <tr>
               <td class="img-content">
                   <a href="{{ product.url}}" title="{{ product.name }}" class="product-image{% if not product.available %}out-stock-img{% endif %}">
                        {{ product.featured_image | product_image_url("small") | img_tag(product.featured_image.alt) }}
                    </a>
               </td>
               <td>
                    <a href="{{ product.url}}" title="{{ product.name }}" class="product-image{% if not product.available %}out-stock-img{% endif %}">
                        {{ product.name }}
                    </a>
               </td>   
               <td>Categoria</td>  
               <td>Estoque</td>  
               <td>{{ product.price | money }}</td>         
            </tr> 

        {% endfor %}
        
    </tbody>
    
</table>