<?php include_once("frames/header.php")?>
        
<?php include_once("frames/nav.php")?>
            
        <section class="produtos">
                                                
                <div class="produto-content">
                    
                    <h1>Nossos Produtos</h1>
                    
                    <ul class="breadcrumb">
		
					   <li class="active"><a href="#">Home</a></li>
            		   <li>Todos os Produtos</li>  
                        
		            </ul>
                    
                    <div class="cabecalho">
                    
                        <p class="quantidade-produtos">58 Produtos</p>
                        
                        <select class="sort-by form-control">
                            <option value="1">Ordenar Por</option>
                            <option value="price-ascending">Preço: Menor ao Maior</option>
                            <option value="price-descending">Preço: Maior ao Menor</option>
                            <option value="alpha-ascending" selected="">A - Z</option>
                            <option value="alpha-descending">Z - A</option>
                            <option value="created-descending">Mais Novo ao mais Antigo</option>
                            <option value="created-ascending">Mais Antigo ao mais Novo</option>
                            <option value="best-selling">Mais Vendidos</option>
                        </select>
                        
                    </div>
                    
                    <div class="boxes">
                        
                        <?php for($i=1;$i <= 20;$i++){?>
                        
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
                    
                    <ul class="pagination">
                        <li><a class="active" href="/produtos/">1</a></li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#">4</a></li>
                        <li><a href="#">5</a></li>
                    </ul>
                    
                </div>
            
                <?php include_once("frames/aside_categorias_produtos.php")?>
            
        </section>    
        
<?php include_once("frames/footer.php")?>