{% for item in navigation %}
            <div class="box">
                <a href="{{ item.url }}" {% if item.url | is_external %}target="_blank"{% endif %}>
                    <div class="img-content">   
                        {% if item.name == 'Alfabetização'%}
                            {{ "img/Categorias/Alfabetizacao.png" | static_url | img_tag("Brinquedo Alfabetização", {'class' : "link"})}}
                            {{ "img/Categorias/Alfabetizacao_hover.png" | static_url | img_tag("Brinquedo Alfabetização", {'class' : "hover"})}}
                        {% endif %}

                        {% if item.name == 'Alimentos'%}
                            {{ "img/Categorias/Alimentos.png" | static_url | img_tag("Brinquedo Alfabetização", {'class' : "link"})}}
                            {{ "img/Categorias/Alimentos_hover.png" | static_url | img_tag("Brinquedo Alfabetização", {'class' : "hover"})}}
                        {% endif %}
          
                        {% if item.name == 'Alinhavo'%}
                            {{ "img/Categorias/Alinhavo.png" | static_url | img_tag("Brinquedo Alfabetização", {'class' : "link"})}}
                            {{ "img/Categorias/Alinhavo_hover.png" | static_url | img_tag("Brinquedo Alfabetização", {'class' : "hover"})}}
                        {% endif %}
                    
                        {% if item.name == 'Amamentação'%}
                            {{ "img/Categorias/Amamentacao.png" | static_url | img_tag("Brinquedo Alfabetização", {'class' : "link"})}}
                            {{ "img/Categorias/Amamentacao_hover.png" | static_url | img_tag("Brinquedo Alfabetização", {'class' : "hover"})}}
                        {% endif %}
                     
                        {% if item.name == 'Animais'%}
                            {{ "img/Categorias/Animais.png" | static_url | img_tag("Brinquedo Alfabetização", {'class' : "link"})}}
                            {{ "img/Categorias/Animais_hover.png" | static_url | img_tag("Brinquedo Alfabetização", {'class' : "hover"})}}
                        {% endif %}
                     
                        {% if item.name == 'Ar livre'%}
                            {{ "img/Categorias/Ar livre.png" | static_url | img_tag("Brinquedo Alfabetização", {'class' : "link"})}}
                            {{ "img/Categorias/Ar livre_hover.png" | static_url | img_tag("Brinquedo Alfabetização", {'class' : "hover"})}}
                        {% endif %}
                     
                        {% if item.name == 'Bicicletas'%}
                            {{ "img/Categorias/Bicicletas.png" | static_url | img_tag("Brinquedo Alfabetização", {'class' : "link"})}}
                            {{ "img/Categorias/Bicicletas_hover.png" | static_url | img_tag("Brinquedo Alfabetização", {'class' : "hover"})}}
                        {% endif %}
                     
                        {% if item.name == 'Bonecos'%}
                            {{ "img/Categorias/Bonecos.png" | static_url | img_tag("Brinquedo Alfabetização", {'class' : "link"})}}
                            {{ "img/Categorias/Bonecos_hover.png" | static_url | img_tag("Brinquedo Alfabetização", {'class' : "hover"})}}
                        {% endif %}
                        
                        {% if item.name == 'Brinquedos de Madeira'%}
                            {{ "img/Categorias/Brinquedos de Madeira.png" | static_url | img_tag("Brinquedo Alfabetização", {'class' : "link"})}}
                            {{ "img/Categorias/Brinquedos de Madeira_hover.png" | static_url | img_tag("Brinquedo Alfabetização", {'class' : "hover"})}}
                        {% endif %}
                        
                        {% if item.name == 'Casinhas'%}
                            {{ "img/Categorias/Casinhas.png" | static_url | img_tag("Brinquedo Alfabetização", {'class' : "link"})}}
                            {{ "img/Categorias/Casinhas_hover.png" | static_url | img_tag("Brinquedo Alfabetização", {'class' : "hover"})}}
                        {% endif %}
                        
                        {% if item.name == 'Encaixe'%}
                            {{ "img/Categorias/Encaixe.png" | static_url | img_tag("Brinquedo Alfabetização", {'class' : "link"})}}
                            {{ "img/Categorias/Encaixe_hover.png" | static_url | img_tag("Brinquedo Alfabetização", {'class' : "hover"})}}
                        {% endif %}
                        
                        {% if item.name == 'Equilíbrio'%}
                            {{ "img/Categorias/Equilibrio.png" | static_url | img_tag("Brinquedo Alfabetização", {'class' : "link"})}}
                            {{ "img/Categorias/Equilibrio_hover.png" | static_url | img_tag("Brinquedo Alfabetização", {'class' : "hover"})}}
                        {% endif %}
                        
                        {% if item.name == 'Faz de Conta'%}
                            {{ "img/Categorias/Faz de Conta.png" | static_url | img_tag("Brinquedo Alfabetização", {'class' : "link"})}}
                            {{ "img/Categorias/Faz de Conta_hover.png" | static_url | img_tag("Brinquedo Alfabetização", {'class' : "hover"})}}
                        {% endif %}
                        
                        {% if item.name == 'Ferramentas'%}
                            {{ "img/Categorias/Ferramentas.png" | static_url | img_tag("Brinquedo Alfabetização", {'class' : "link"})}}
                            {{ "img/Categorias/Ferramentas_hover.png" | static_url | img_tag("Brinquedo Alfabetização", {'class' : "hover"})}}
                        {% endif %}
                        
                        {% if item.name == 'Formas'%}
                            {{ "img/Categorias/Formas.png" | static_url | img_tag("Brinquedo Alfabetização", {'class' : "link"})}}
                            {{ "img/Categorias/Formas_hover.png" | static_url | img_tag("Brinquedo Alfabetização", {'class' : "hover"})}}
                        {% endif %}
                        
                        {% if item.name == 'Instrumentos Musicais'%}
                            {{ "img/Categorias/Instrumentos Musicais.png" | static_url | img_tag("Brinquedo Alfabetização", {'class' : "link"})}}
                            {{ "img/Categorias/Instrumentos Musicais_hover.png" | static_url | img_tag("Brinquedo Alfabetização", {'class' : "hover"})}}
                        {% endif %}
                        
                        {% if item.name == 'Kits de Ferramentas'%}
                            {{ "img/Categorias/Kits de Ferramentas.png" | static_url | img_tag("Brinquedo Alfabetização", {'class' : "link"})}}
                            {{ "img/Categorias/Kits de Ferramentas_hover.png" | static_url | img_tag("Brinquedo Alfabetização", {'class' : "hover"})}}
                        {% endif %}
                        
                        {% if item.name == 'Lousas'%}
                            {{ "img/Categorias/Lousas.png" | static_url | img_tag("Brinquedo Alfabetização", {'class' : "link"})}}
                            {{ "img/Categorias/Lousas_hover.png" | static_url | img_tag("Brinquedo Alfabetização", {'class' : "hover"})}}
                        {% endif %}
                        
                        {% if item.name == 'Pocoyo'%}
                            {{ "img/Categorias/Pocoyo.png" | static_url | img_tag("Brinquedo Alfabetização", {'class' : "link"})}}
                            {{ "img/Categorias/Pocoyo_hover.png" | static_url | img_tag("Brinquedo Alfabetização", {'class' : "hover"})}}
                        {% endif %}
                        
                        {% if item.name == 'Quebra-cabeça'%}
                            {{ "img/Categorias/Quebra-cabeca.png" | static_url | img_tag("Brinquedo Alfabetização", {'class' : "link"})}}
                            {{ "img/Categorias/Quebra-cabeca_hover.png" | static_url | img_tag("Brinquedo Alfabetização", {'class' : "hover"})}}
                        {% endif %}
                        
                        {% if item.name == 'Veículos'%}
                            {{ "img/Categorias/Veiculos.png" | static_url | img_tag("Brinquedo Alfabetização", {'class' : "link"})}}
                            {{ "img/Categorias/Veiculos_hover.png" | static_url | img_tag("Brinquedo Alfabetização", {'class' : "hover"})}}
                        {% endif %}
                        
                    </div>
                    <h3>{{ item.name }}</h3>
                </a>	
            </div>
{% endfor %}