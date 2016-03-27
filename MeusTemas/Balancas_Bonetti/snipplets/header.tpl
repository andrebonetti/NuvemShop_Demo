        <div class="top-header">
            <div class="myContainer">
                
                <a href="">SITEMAP</a>
                <a href="" data-toggle="modal" data-target="#mdlContato">CONTATO</a>
                
                {% if store.has_accounts %}
                <!-- if store.has_accounts -->  
                
                    {% if not customer %}
                        <!-- if not customer -->  
                        {{ "LOGIN" | a_tag(store.customer_login_url) }}
                
                        {% if 'mandatory' not in store.customer_accounts %}
                            <!-- if 'mandatory' not in store.customer_accounts -->  
                            {{ "CADASTRAR" | a_tag(store.customer_register_url) }}
                        {% endif %}
                
                    {% else %}
                        <!-- ELSE - if not customer -->  
                        {{ "MINHA CONTA" | a_tag(store.customer_home_url) }}
                        {{ "SAIR" | a_tag(store.customer_logout_url) }}
                
                    {% endif %}
                {% endif %}

                <p class="telefone">(11) 2023-1723</p>                
                <p class="telefone">(11) 2682-2830 |</p>
                
            </div>
        </div>
        
        <header>  
            
            <div class="logo">
                
                {% if has_logo %}
                    <!-- if has_logo -->   
				    {{ store.logo | img_tag | a_tag(store.url) }}
		        {% else %}
                    <!-- ELSE - if has_logo -->  
			         {{ store.name | a_tag(store.url) }}
		        {% endif %}
                
                <h1>Venda de Balanças Novas e Usadas</h1>
                <h2>Assistência Técnica de Balanças e Acessórios</h2>
                
            </div>
                     
            <div class="icones_destaque">
                
                <a href="{{store.cart_url}}">
                    {{ "img/icone_carrinho.png" | static_url | img_tag("Carrinho", {'class' : "carrinho"})}}
                    <p>{{ cart.items_count }}</p>
                </a>
                
                <a href="">
                    {{ "img/icone_favoritos.png" | static_url | img_tag("Favoritos", {'class' : "favoritos"})}}
                    <p>0</p>
                </a>
                
            </div>
            
            <div class="busca">
                <input type="text" class="form-control" placeholder="Buscar">
                <a href="">
                    {{ "img/icone_botao.png" | static_url | img_tag("Icone Busca")}}
                </a>
            </div>
                
        </header>