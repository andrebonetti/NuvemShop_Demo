<div class="page-content">
    <div class="headerBox-Page">
        <h2>{{ "Crear cuenta" | translate }}</h2>
    </div>
    {% snipplet "breadcrumbs.tpl" %}
    <div class="container-fluid">
        <div class="account-form-wrapper offset4">
            <form id="login-form" action="" method="post" class="contact_form">
                {% if result.errors.name %}
                    <div class="span6 st error c">{{ 'Debes ingresar tu nombre!' | translate }}</div>
                {% endif %}
                {% if result.errors.email == 'exists' %}
                    <div class="span6 st error c">{{ 'Ya existe una cuenta para este email!' | translate }}</div>
                {% elseif result.errors.email %}
                    <div class="span6 st error c">{{ 'Debes ingresar un email válido!' | translate }}</div>
                {% endif %}
                {% if result.errors.password == 'required' %}
                    <div class="span6 st error c">{{ 'Debes ingresar tu contraseña!' | translate }}</div>
                {% endif %}
                {% if result.errors.password == 'confirmation' %}
                    <div class="span6 st error c">{{ 'Las contraseñas no coinciden.' | translate }}</div>
                {% endif %}
                {% if store_fb_app_id %}
                    <div class="span6">
                        <i class="fa fa-facebook"></i>
                        <input class="submit_button facebook" type="button" value="{{ 'Regístrate con Facebook' | translate }}" onclick="loginFacebook();" />
                    </div>
                    <div class="span6 text-center">
                        <span class="badge">{{ 'o' | translate }}</span>
                        <hr class="featurette-or-divider"></hr>
                    </div>
                {% endif %}
                <div class="field">
                    <div class="span1">
                        <label for="name">{{ 'Nombre' | translate }}</label>
                    </div>
                    <div class="span5">
                        <input type="text" name="name" id="name" value="{{ result.name }}" />
                    </div>
                </div>
                <div class="field">
                    <div class="span1">
                        <label for="email">{{ 'Email' | translate }}</label>
                    </div>
                    <div class="span5">
                        <input autocorrect="off" autocapitalize="off" type="email" name="email" id="email" value="{{ result.email }}" />
                    </div>
                </div>
                <div class="field">
                    <div class="span1">
                        <label for="phone">{{ 'Teléfono' | translate }} {{ '(opcional)' | translate }}</label>
                    </div>
                    <div class="span5">
                        <input type="text" name="phone" id="phone" value="{{ result.phone }}" />
                    </div>
                </div>
                <div class="field">
                    <div class="span1">
                        <label for="password">{{ 'Contraseña' | translate }}</label>
                    </div>
                    <div class="span5">
                        <input type="password" name="password" id="password" />
                    </div>
                </div>
                <div class="field">
                    <div class="span1">
                        <label for="password_confirmation">{{ 'Confirmar Contraseña' | translate }}</label>
                    </div>
                    <div class="span5">
                        <input type="password" name="password_confirmation" id="password_confirmation" />
                    </div>
                </div>
                <input class="submit_button" type="submit" value="{{ 'Crear cuenta' | translate }}" />
            </form>
        </div>
    </div>
</div>
