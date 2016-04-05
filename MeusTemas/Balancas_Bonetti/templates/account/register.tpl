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
        
        <div class="img-register">
            
        </div>
        
        <div class="cadastro-conta">
        
            <h2>Cadastre-se</h2>
            
            <form action="" id="login-form" class="acount" method="post">
            
                    <!-- INPUTS --->
                    
                    <label>Nome Completo:</label>
                    <input type="text" name="name" id="name" class="form-control" value="{{ result.name }}" placeholder="Nome Completo"/>
                    
                    <label>E-mail:</label>
                    <input autocorrect="off" autocapitalize="off" type="email" name="email" id="email" class="form-control" value="{{ result.email }}" placeholder="E-mail" />
                    
                    <label>Telefone:</label>
                    <input type="text" name="phone" id="phone" class="form-control"  value="{{ result.phone }}" placeholder="Telefone"/>
                    
                    <label>Senha:</label>
                    <input type="password" name="password" id="password" class="form-control" placeholder="Senha"/>
                    
                    <label>Confirmar Senha:</label>
                    <input type="password" name="password_confirmation" class="form-control" placeholder="Confirmar Senha" id="password_confirmation" />

                    <input class="form-control btn btn-danger" type="submit" value="{{ 'Crear cuenta' | translate }}" />
                
            </form>
        
        </div>
        
</section> 
