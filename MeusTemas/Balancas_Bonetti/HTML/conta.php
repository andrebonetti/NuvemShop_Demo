<?php include_once("frames/header.php")?>
        
<?php include_once("frames/nav.php")?>

    <section class="conta">
    
        <h1>Minha Conta</h1>
        
        <div class="meus-pedidos">
            
            <h2>Meus Pedidos</h2>
            
            <table class="table">
                
                <tr>
                    <th>Pedido</th>
                    <th>Data</th>
                    <th>Estado</th>
                    <th>Pagamento</th>
                    <th>Frete</th>
                    <th>Total</th>
                </tr>
                    <td>123456</td>
                    <td>10/03/2016</td>
                    <td>Em Andamento</td>
                    <td>R$89,90</td>
                    <td>R$15,00</td>
                    <td>R$104,90</td>
                <tr>
                    
                </tr>
                
            </table>
            
        </div>    
        
        <aside>
            
            <div class="dados-pessoais">
                
                <h2>Dados Pessoais</h2>
                
                <img src="img/usuario.png">
                
                <p>Nome Usuário</p>
                <p>email@email.com.br</p>
                
                <a href="editarCadastro.php">Editar meu Cadastro</a>
                
            </div>    
            
        </aside>
        
    </section>    

<?php include_once("frames/footer.php")?>