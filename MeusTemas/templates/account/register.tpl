<section class="conta">
    
    <h1>{{ "Crear cuenta" | translate }}</h1>
    
    <form action="" id="login-form" class="acount" method="post">
            
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
                <p class="alert alert-danger">{{ 'Las contraseñas no coinciden.' | translate }}</p>
            {% endif %}
            
            
            <!-- INPUTS --->
            
            <input type="text" name="name" id="name" class="form-control" value="{{ result.name }}" placeholder="Nome Completo"/>
            <input autocorrect="off" autocapitalize="off" type="email" name="email" id="email" class="form-control" value="{{ result.email }}" placeholder="E-mail" />
            <input type="text" name="phone" id="phone" class="form-control"  value="{{ result.phone }}" placeholder="Telefone"/>
            <input type="password" name="password" id="password" class="form-control" placeholder="Senha"/>
            <input type="password" name="password_confirmation" class="form-control" placeholder="Confirmar Senha" id="password_confirmation" />

            <input class="submit_button" type="submit" value="{{ 'Crear cuenta' | translate }}" />
    </form>
    
    {{ "img/brinquedo-registrer-teste.jpg" | static_url | img_tag("Cadastro La No Parque Brinquedos", {'class' : "register-img"}) }}

</section>
