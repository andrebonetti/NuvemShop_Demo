<?php include_once("frames/header.php")?>
        
<?php include_once("frames/nav.php")?>

    <section class="produtos">
    
        <div class="produto-content">
                    
                    <h1>Nome do Produto</h1>
                    
                    <ul class="breadcrumb">
		
					   <li class="active"><a href="#">Home</a></li>
            		   <li>Todos os Produtos</li>  
                        
		            </ul>
                    
                    <div class="produto-detalhes">
                        
                        <div class="img-content">
                        
                            <div class="img-principal">
                                <img src="img/balanca.png">
                            </div>
                            <div class="imgs-boxes">
                                <div class="box">
                                    <img src="img/balanca.png">  
                                </div>
                                <div class="box">
                                    <img src="img/balanca.png">  
                                </div>
                                <div class="box">
                                    <img src="img/balanca.png">  
                                </div>
                                <div class="box">
                                    <img src="img/balanca.png">  
                                </div>
                            </div>
                            
                        </div>
                        
                        <div class="detalhes">
                        
                            <div class="descricao">
                                
                                <h2>Descrição</h2>
                                
                                <p>A balança eletrônica modelo 3400 é rápida,confiável e versátil.</p>

                                <p>Com avançada tecnologia, é programável via teclado, permitindo ao usuário 
                                    configurá-Ia de acordo com a aplicação de pesagem ou contagem à que se destina.</p>

                                <p>Como contadora, requer apenas a informação do peso médio da peça, ou uma amostra,
                                    para efetuar automaticamente a contagem de grandes lotes.</p>

                                <p>Possui seleção de filtro digital em 15 níveis para controlar 
                                    a estabilização da pesagem ou contagem em locais sujeitos a vibrações</p>

                                <p>Durante a contagem, permite, em displays independentes, a visualização das 
                                    informações de peso bruto ou líquido, peso médio por peça e número de peças.</p>

                                <p>Em conjunto com etiquetadores, impressoras ou computadores pode ser 
                                    utilizada em sistemas automatizados de controle e de coleta de dados.</p>

                                <p>Comprove e deixe uma balança eletrônica contadora Toledo trabalhar por você.</p>
                              
                            </div>
                            
                            <div class="caracteristicas_tecnicas">
                                
                                <h2>Caracteristicas Técnicas:</h2>
                                
                                <p>Display:LCD</p>
                                <p>Teclado:17 digitos</p>
                                <p>Gabinete de Plastico ABS</p>
                                <p>110/220(Bivolt)</p>
                                <p>Tempo de Recarga:12h</p>
                                
                                
                            </div>
                            
                            <div class="especificacoes">
                                
                                <h2>Especificações:</h2>
                                
                                <p>Capacidade: 30 Kg</p>
                                <p>Precisão: 0.5 g</p>
                                <p>Display: N</p>
                                <p>Bateria: 140h</p>
                                <p>Impressora: N</p>
                                <p>Conexão: Comunicação Serial RS-232</p>
                                
                                <a href="http://www.toledobrasil.com.br/balanca/balancas-de-bancada/3400">Veja a descrição completa no site do fabricante</a>
                                
                            </div>
                            
                            <div class="calculo_frete"></div>
                            
                            <div class="valor"></div>
                            
                            <div class="comprar"></div>
                            
                        </div>
                        
                    </div>        
        </div>
            
        <?php include_once("frames/aside_categorias_produtos.php")?>
        
        <div class="produtos-relacionados">
            
            <h2>Produtos Relacionados</h2>
            
            <div class="boxes">

                <?php for($i=1;$i <= 10;$i++){?>

                    <div class="box">

                        <a class="img-content" href="produto_detalhes.php">
                            <img src="img/balanca.png">
                        </a>
                        <h2>Nome Produto 1</h2>
                        <p class="valor">R$00,00</p>
                        <a class="btn-detalhes" href="">Detalhes</a>

                    </div>

                <?php } ?>

            </div>
                
        </div>

    </section>    

<?php include_once("frames/footer.php")?>