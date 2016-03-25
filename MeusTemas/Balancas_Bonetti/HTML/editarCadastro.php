<?php include_once("frames/header.php")?>
        
<?php include_once("frames/nav.php")?>

    <section class="conta">
    
        <h1>Editar Cadastro</h1>
        
        <div class="editar-conta">
            
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

                    <input type="submit" class="form-control btn btn-primary" value="Cadastrar">
                    <a href="#" class="btn btn-danger">Cancelar</a>
            </form>
            
        </div>    
        
    </section>    


<?php include_once("frames/footer.php")?>