<div class="page-content">
    <div class="headerBox-Page">
        <h2>{{ "Cambiar Contraseña" | translate }}</h2>
    </div>
    {% snipplet "breadcrumbs.tpl" %}
    <div class="account-form-wrapper">
        <p class="st c">{{ 'Te enviaremos un email para que puedas cambiar tu contraseña.' | translate }}</p>
        <form action="" method="post" class="contact_form">
            {% if failure %}
                <div class="st error c">{{ 'No existe ningún cliente con el email ingresado.' | translate }}</div>
            {% elseif success %}
                <div class="st success c">{{ 'Te enviamos un email a {1}' | translate(email) }}</div>
            {% endif %}
            <div class="field">
                <div class="span1">
                    <label for="email">{{ 'Email' | translate }}</label>
                </div>
                <div class="span3">
                    <input autocorrect="off" autocapitalize="off" type="email" name="email" id="email" value="{{ email }}" />
                </div>
            </div>
            <input class="submit_button" type="submit" value="{{ 'Enviar email' | translate }}" />
        </form>
    </div>
</div>
