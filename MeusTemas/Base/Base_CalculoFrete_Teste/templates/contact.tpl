    {% if contact and contact.type == 'contact' %}
        {% if contact.success %}
            <div class="alert alert-success">{{ "El mensaje ha sido enviado con éxito, muchas gracias." | translate }}</div>
        {% else %}
            <div class="alert alert-error">{{ "Debes completar los datos de contacto." | translate }}</div>
        {% endif %}
    {% endif %}

<section class="contato" id="atual-page">

    <h1>Fale Conosco</h1>
    
    <p class="texto-contato">Crítica, sugestão ou elogio? Envie-nos!<br> Queremos sempre melhorar nossos serviços.</p>
    
    {{ "img/contato_imgs/noun_10221_cc.png" | static_url | img_tag("Instagran La No Parque", {'class' : "img-1"})}}
    {{ "img/contato_imgs/noun_23646_cc.png" | static_url | img_tag("Instagran La No Parque", {'class' : "img-2"})}}
    {{ "img/contato_imgs/noun_26755_cc.png" | static_url | img_tag("Instagran La No Parque", {'class' : "img-3"})}}
    {{ "img/contato_imgs/noun_63894_cc.png" | static_url | img_tag("Instagran La No Parque", {'class' : "img-4"})}}
    
     <form action="/winnie-pooh" method="post" onsubmit="$(this).attr('action', '');">
                        
        <input type="hidden" value="{{ product.id }}" name="product"/>
        <input type="text" id="name" name="name" class="form-control" placeholder="Nome Completo "/>    
        <input type="email" id="email" name="email" class="form-control" placeholder="Email "/>
        <input type="text" id="phone" name="phone" class="form-control" placeholder="Telefone (Opcional) "/>
        <textarea id="message" name="message" cols="20" rows="5" class="form-control" placeholder="Sua mensagem ..."></textarea>
                                
                        
        <input type="hidden" name="type" value="contact" />
        <input type="submit" class="submit_button" value="{{ 'Enviar' | translate }}" name="contact"/>
    </form>
    
</section>