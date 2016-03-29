        <footer>
            
            <div class="myContainer">
            
                <div>
            
                    <h2>Informações</h2>
                    
                    <div class="lista">
                        
                        <a href="#">Sobre Nós</a>
                        <a href="#">Informações sobre Entrega</a>
                        <a href="#">Politica de Privacidade</a>
                        <a href="#">Termos e Condições</a>
                        <a href="#">Blog</a>
                        
                    </div>    

                    <h2>Conta</h2>
                    
                    <div class="lista">
                        
                        <a href="#">Minha Conta</a>
                        <a href="#">Favoritos</a>
                        <a href="#">Histórico de Compras</a>
                        
                    </div>    
                
                </div>
            
                <div>

                    <h2>Categorias</h2>
                    
                    <div class="lista">
                        
                        <a href="#">Amaciadores de Carne</a>
                        <a href="#">Balanças</a>
                        <a href="#">Batedeiras</a>
                        <a href="#">Cafeteiras</a>
                        <a href="#">Cortadores de Frios</a>	
                        <a href="#">Cutters</a>	
                        <a href="#">Extratores de Suco</a>	
                        <a href="#">Fatiadores de Carne</a>
                        <a href="#">Fritadeiras Elétricas</a>
                        <a href="#">Liquidificadores</a>	
                        <a href="#">Moedores de Carne</a>
                        <a href="#">Processadores de Alimento</a>	
                        <a href="#">Raladores de Queijo</a>
                        <a href="#">Serras</a>
                        
                    </div>
                    
                </div>

                <div>

                    <h2>Contato</h2>
                    
                    <div class="lista">
                        
                        <h3>Endereço</h3>
                        
                        <p>Av. Itinguçu, 2485</p>
                        <p>Penha</p>
                        <p>São Paulo, SP</p>

                        <h3>Telefones</h3>
                        
                        <p>(11) 2023-1723</p>                
                        <p>(11) 2682-2830</p>

                        <h3>E-mail</h3>
                        
                        <p>bonettisilveira@terra.com.br</p> 
                        
                    </div>
                    
                    <h2>Redes Sociais</h2>
                    
                    <div class="lista">
                        
                        <a href="#">Facebook</a>
                        <a href="#">Instagran</a>
                        <a href="#">Twitter</a>
                        
                    </div>    

                </div>
                
            </div>    
            
        </footer>

        <!-- Modal Contato -->
        <div class="modal fade" id="mdlContato" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">Contato</h4>
              </div>
              <div class="modal-body">
                  
                <h2>Telefone</h2>
                  
                <p>(11) 2023-1723</p>                
                <p>(11) 2682-2830</p>
           
                <h2>E-mail</h2>

                    {% if contact and contact.type == 'contact' %}
                  
                        <!-- if contact and contact.type == 'contact' -->
                        {% if contact.success %}
                            <!-- if contact.success -->
                            <p class="alert alert-success">{{ "El mensaje ha sido enviado con éxito, muchas gracias." | translate }}</p>
                        {% else %}
                            <!-- ELSE - if contact.success -->
                            <p class="alert alert-danger">{{ "Debes completar los datos de contacto." | translate }}</p>
                        {% endif %}
                  
                    {% endif %}

                    <form class="contact_form" action="/winnie-pooh" method="post" onsubmit="$(this).attr('action', '');">
                        
                        <input type="hidden" value="{{ product.id }}" name="product"/>
                
				        <input type="text" id="name" name="name" class="form-control nome" placeholder="Nome Completo" required>
				        
                        <input type="email" id="email" name="email" class="form-control email" placeholder="Seu E-mail " required>
				        
                        <input type="text" id="phone" name="phone" class="form-control telefone" placeholder="Telefone com DDD" required maxlength="11">

                        <textarea  id="message" name="message" class="form-control" placeholder="Mensagem" required rows="4"></textarea><br>
                                   
                        <input type="hidden" value="contact" name="type"/>
                        
                        <input type="submit" class="btn btn-primary" value="{{ 'Enviar' | translate }}" name="contact"/>
                        
                        <button class="btn btn-danger" type="reset">Limpar</button>
                  
				  </form>
                  
              </div>
            </div>
          </div>
        </div>