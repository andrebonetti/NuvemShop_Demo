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

                  <form action="" method="" class="">
                  
                        <select class="form-control" name="assunto" autofocus>
                            <option>Selecione o Assunto</option>
                            <option value="Orçamento">Orçamento</option>
                            <option value="Currículo">Curriculo</option>
                            <option value="Dúvidas">Duvidas</option>
                            <option value="Reclamações">Reclamações</option>
                            <option value="Outros">Outros</option>
                        </select>
                  
				        <input type="text" name="nome" class="form-control nome" placeholder="Nome Completo" required>
				        
				        <input type="text" name="empresa" class="form-control empresa" placeholder="Empresa" required>
				        
                        <input type="text" name="segmento" class="form-control segmento" placeholder="Segmento" required>
				        
                        <input type="email" name="email" class="form-control email" placeholder="Seu E-mail " required>
				        
                        <input type="text" name="telefone" class="form-control telefone" placeholder="Telefone com DDD" required maxlength="11">
				        
                        <select name="estado" class="form-control estado" required>
                            <option value="">Selecione o Estado</option> 
                            <option value="AC">Acre</option> 
                            <option value="AL">Alagoas</option> 
                            <option value="AM">Amazonas</option> 
                            <option value="AP">Amapá</option> 
                            <option value="BA">Bahia</option> 
                            <option value="CE">Ceará</option> 
                            <option value="DF">Distrito Federal</option> 
                            <option value="ES">Espírito Santo</option> 
                            <option value="GO">Goiás</option> 
                            <option value="MA">Maranhão</option> 
                            <option value="MT">Mato Grosso</option> 
                            <option value="MS">Mato Grosso do Sul</option> 
                            <option value="MG">Minas Gerais</option> 
                            <option value="PA">Pará</option> 
                            <option value="PB">Paraíba</option> 
                            <option value="PR">Paraná</option> 
                            <option value="PE">Pernambuco</option> 
                            <option value="PI">Piauí</option> 
                            <option value="RJ">Rio de Janeiro</option> 
                            <option value="RN">Rio Grande do Norte</option> 
                            <option value="RO">Rondônia</option> 
                            <option value="RS">Rio Grande do Sul</option> 
                            <option value="RR">Roraima</option> 
                            <option value="SC">Santa Catarina</option> 
                            <option value="SE">Sergipe</option> 
                            <option value="SP">São Paulo</option> 
                            <option value="TO">Tocantins</option> 
                        </select>
                  
                        <input type="text" name="cidade" class="form-control cidade" placeholder="Cidade">
                  
                        <input type="text" name="bairro" class="form-control bairro" placeholder="Bairro" required>
				        
                        <textarea  name="mensagem" class="form-control" placeholder="Mensagem" required rows="4"></textarea><br>
                                   
				        <button class="btn btn-primary" type="submit">Enviar</button>
                        <button class="btn btn-danger" type="reset">Limpar</button>
                  
				  </form>
                  
              </div>
            </div>
          </div>
        </div>


    </body>
</html> 