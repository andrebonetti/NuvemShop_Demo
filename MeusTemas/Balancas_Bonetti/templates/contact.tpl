<section class="servicos">
            
    {% if contact and contact.type == 'contact' %}
                  
        <!-- if contact and contact.type == 'contact' -->
        {% if contact.success %}
            <!-- if contact.success -->
            <p class="alert alert-success" style="text-align:center;">{{ "El mensaje ha sido enviado con éxito, muchas gracias." | translate }}</p>
        {% else %}
            <!-- ELSE - if contact.success -->
            <p class="alert alert-danger" style="text-align:center;">{{ "Debes completar los datos de contacto." | translate }}</p>
        {% endif %}
                  
    {% endif %}
            
</section>  