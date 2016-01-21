<section class="conta">
    
        <h1>Login</h1>
    
        {% if not result.facebook and result.invalid %}
            <p class="alert alert-danger">{{ 'El email o la contraseña son incorrectos.' | translate }}</p>
        {% elseif result.facebook and result.invalid %}
            <p class="alert alert-danger">{{ 'Hubo un problema con el login de Facebook.' | translate }}</p>
        {% endif %}

        <form id="login-form" action="" class="acount login" method="post" class="form-horizontal">
                
            <input autocorrect="off" autocapitalize="off" class="form-control" type="email" name="email" placeholder="E-mail" value="{{ result.email }}" />
            <input type="password" class="form-control"  name="password" placeholder="Senha"/>

            <input class="submit_button" type="submit" value="{{ 'Iniciar sesión' | translate }}" />
                
        </form>

</section>
