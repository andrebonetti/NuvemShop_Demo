       <tr>
           
               <td class="img-content">
                   <a href="{{ product.url}}" title="{{ product.name }}" class="product-image{% if not product.available %}out-stock-img{% endif %}">
                        {{ product.featured_image | product_image_url("small") | img_tag(product.featured_image.alt) }}
                    </a>
               </td>
               <td>
                    <a href="{{ product.url}}" title="{{ product.name }}" class="product-image{% if not product.available %}out-stock-img{% endif %}">
                        {{ product.name }}</td>
                    </a>
               <td>Categoria</td>  
               <td>Estoque</td>  
               <td>{{ product.price | money }}</td>
               
            
        </tr>    
        