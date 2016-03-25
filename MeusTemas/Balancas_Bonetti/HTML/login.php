<?php include_once("frames/header.php")?>
        
<?php include_once("frames/nav.php")?>
            
    <section class="login">
        
        <div class="login-conta">
            
            <h1>Login</h1>
            
            <form>
                
                <label>E-mail:</label>
                <input type="text" class="form-control">
                
                <label>Senha:</label>
                <input type="password" class="form-control">
                
                <input type="submit" class="form-control btn btn-primary" value="Entrar">
                
                <p><a href="#">Esqueceu Senha</a></p>
                
            </form>
            
        </div>
        
        <div class="cadastro-conta">
        
            <h2>Cadastre-se</h2>
        
            <form>
                
                <label>Nome Completo:</label>
                <input type="text" class="form-control">
                
                <label>E-mail:</label>
                <input type="text" class="form-control">
                
                <label>Telefone:</label>
                <input type="text" class="form-control">
                
                <label>Senha:</label>
                <input type="password" class="form-control">
                
                <label>Confirmar Senha:</label>
                <input type="password" class="form-control">
                
                <input type="submit" class="form-control btn btn-danger" value="Cadastrar">
                
            </form>
            
        </div>
        
    </section>    

<?php include_once("frames/footer.php")?>