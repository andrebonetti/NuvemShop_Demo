<div class="myContainer">
            
            <div class="logo">
                {{ store.logo  | img_tag(store.name) | a_tag(store.url)}}
            </div>
                        
            <div class="usuario">
                
                <a class="carrinho" href="{{ store.cart_url }}">
                    {{cart.items_count}}
                </a>  
                
                {% if not customer %}
                    <!-- if not customer == TRUE -->
                        <!-- Iniciar sesión -->
                        {{ "Iniciar sesión" | translate | a_tag(store.customer_login_url, {'class': 'cadastrar'}) }}
                        {% if 'mandatory' not in store.customer_accounts %}
                            <!-- if not customer == TRUE -->
                            {{ "Crear cuenta" | translate | a_tag(store.customer_register_url, {'class': 'login'}) }}
                        {% endif %}

                    {% else %}
                    <!-- if not customer == FALSE -->
                    
                    {{ "Cerrar sesión" | translate | a_tag(store.customer_logout_url, {'class': 'encerrar-secao'}) }}
                    {{ "Mi cuenta" | translate | a_tag(store.customer_home_url, {'class': 'minha-conta'}) }}
               
                {% endif %}
              
            </div>
            
            <nav class="header">
                <ul id="menu" class="sf-menu hidden-phone">
                    {% snipplet "navigation.tpl" %}
                    <li class="search">
                        <form action="{{ store.search_url }}" method="get">
                            <input class="text-input" type="text" name="q" placeholder="{{ 'buscar' | translate }}"/>
                            <i class="fa fa-search"></i>
                            <input class="submit-search" type="submit" value=""/>
                        </form>
                        <!--<input class="form-control" placeholder="Buscar">
                        <a><img src="img/magnification.png"></a>-->
                    </li>
                </ul>
            </nav>
            
            <div class="categorias-header">
                {% snipplet "categories_header.tpl" %}
            </div>
                     
                <!-- TEMPLATE CONTENT INICIO -->