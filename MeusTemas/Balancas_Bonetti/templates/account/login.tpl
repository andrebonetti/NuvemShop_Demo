 <section class="login">
    
        <!-- ALERTAS DE ERROS -->
        {% if result.errors.name %}
            <p class="alert alert-danger">{{ 'Debes ingresar tu nombre!' | translate }}</p>
        {% endif %}
        {% if result.errors.email == 'exists' %}
            <p class="alert alert-danger">{{ 'Ya existe una cuenta para este email!' | translate }}</p>
        {% elseif result.errors.email %}    
            <p class="alert alert-danger">{{ 'Debes ingresar un email válido!' | translate }}</p>
        {% endif %}
        {% if result.errors.password == 'required' %}
            <p class="alert alert-danger">{{ 'Debes ingresar tu contraseña!' | translate }}</p>
        {% endif %}
        {% if result.errors.password == 'confirmation' %}
            <p class="alert alert-danger">As senhas não coincidem</p>
        {% endif %}
        {% if not result.facebook and result.invalid %}
            <p class="alert alert-danger">Usuário e senha inválidos</p>
        {% elseif result.facebook and result.invalid %}
            <p class="alert alert-danger">Houve ym problema com o login no Facebook</p>
        {% endif %}
        
        <div class="login-conta">
            
            <h1>Login</h1>

            <form id="login-form" action="" class="acount login" method="post" class="form-horizontal">
                              
                <label>E-mail:</label>
                <input autocorrect="off" autocapitalize="off" class="form-control" type="email" name="email" placeholder="E-mail" value="{{ result.email }}" />
            
                <label>Senha:</label>
                <input type="password" class="form-control"  name="password" placeholder="Senha"/>

                <input type="submit" class="form-control btn btn-primary"  value="{{ 'Iniciar sesión' | translate }}" />
               
                <p><a href="{{ store.customer_reset_password_url }}">{{ 'Esqueceu sua Senha?' | translate }}</a></p>
                
            </form>
            
        </div>
        
        <div class="img-login">
                
        </div>
        
</section>    


