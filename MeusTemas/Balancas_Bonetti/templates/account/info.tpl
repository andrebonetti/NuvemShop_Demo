<!-- INFO -->

<section class="conta">
    
        <h1>Editar Cadastro</h1>
        
        <div class="editar-conta">
            
            <form action="" method="post" class="form-horizontal">
                
                    {% if result.errors.name %}
                        <p class="alert alert-danger">O nome é obrigatório</p>
                    {% endif %}
                    {% if result.errors.email == 'exists' %}
                        <p class="alert alert-danger">Ja existe uma conta com esse e-mail</p>
                    {% elseif result.errors.email %}
                        <p class="alert alert-danger">O e-mail não é válido</p>
                    {% endif %}

                    <label>Nome Completo:</label>
                    <input type="text" name="name" class="form-control" id="name" value="{{ result.name | default(customer.name) }}" /><br>

                    <label>E-mail:</label>
                    <input class="form-control" autocorrect="off" autocapitalize="off" type="email" name="email" value="{{ result.email | default(customer.email) }}" /><br>
                    
                    <label>Telefone:</label>
                    <input class="form-control" type="text" name="phone" id="phone" value="{{ result.phone | default(customer.phone) }}" /><br>


                    <input type="submit" class="form-control btn btn-primary" value="Alterar">
                    <a class="btn btn-danger" href="{{store.account_url}}">Cancelar</a>

            </form>
            
        </div>    
        
</section> 