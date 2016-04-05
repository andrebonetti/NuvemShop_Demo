<!-- RESET -->

<section class="login">
    
    <div class="login-conta">
            
            <h1>Esquecei Senha</h1>
            
            <form action="" method="post" class="form-horizontal">
                
                {% if failure %}
                    <div class="alert alert-danger">{{ 'No existe ningún cliente con el email ingresado.' | translate }}</div>
                {% elseif success %}
                    <div class="alert alert-success">{{ 'Te enviamos un email a {1}' | translate(email) }}</div>
                {% endif %}
                
                <label class="control-label" for="email">{{ 'Email' | translate }}</label>
                <input autocorrect="off" autocapitalize="off" type="email" name="email" id="email" value="{{ email }}" class="form-control"/>
                
                <input class="form-control btn btn-primary" type="submit" value="{{ 'Enviar email' | translate }}" />
                
            </form>
                    
    </div>
    
</section>    