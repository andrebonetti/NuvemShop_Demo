<div class="container pagecontact">

        <div class="path">
            {% snipplet "breadcrumbs.tpl" %}
        </div>
		<div class="clear"></div>
		<!-- titles -->
    	<div class="titles">
	    <h1>{{ "Contactanos" | translate }}</h1>
	    </div>
	    <!-- titles -->

            <div class="col-md-6 col-sm-12 col-xs-12">
                <div class="form">
                    {% if contact and contact.type == 'contact' %}
                        {% if contact.success %}
                            <div class="contact-ok">{{ "El mensaje ha sido enviado con éxito, muchas gracias." | translate }}</div>
                        {% else %}
                            <div class="contact-error">{{ "Debes completar los datos de contacto." | translate }}</div>
                        {% endif %}
                    {% endif %}
                
                    <form class="contact_form" action="/winnie-pooh" method="post" onsubmit="$(this).attr('action', '');">
                        <input type="hidden" value="{{ product.id }}" name="product"/>
        
                        
                            <label for="name">{{ "Nombre" | translate }}</label>
                           
                            <input type="text" id="name" name="name"/>
                            
                            <label for="email">{{ "Email" | translate }}</label>
                           
                            <input type="text" id="email" name="email"/>
                            
                            <div class="winnie-pooh">
                            <label for="winnie-pooh">{{ "No completar este campo" | translate }}</label>
                            <input id="winnie-pooh" type="text" name="winnie-pooh"/>
                            </div>
                                                  
                            <label for="phone">
                                {{ "Teléfono" | translate }}
                                <span class="optional">({{ "Opcional" | translate }})</span>
                            </label>
                           
                            <input type="text" id="phone" name="phone"/>
                           
                            <label for="message">
                                {{ "Mensaje" | translate }}
                                <span class="optional">({{ "Opcional" | translate }})</span>
                            </label>
                            
                            <textarea id="message" name="message" cols="20" rows="5" class="inputarea"></textarea>
                            <input type="hidden" value="contact" name="type"/>
                            <input type="submit" class="submit_button" value="{{ 'Enviar' | translate }}" name="contact"/>
                          </form>
                </div>
            </div>
        
    <div class="col-md-6 col-sm-12 col-xs-12">
    	<div id="gmap3" class="gmap3"></div>
    </div>
    
</div>

<!-- banner -->
    {% if "banner-contacto.jpg" | has_custom_image %}
    <div class="container bannerhome">
    {% if settings.banner_contacto_url != '' %}
            {{ "banner-contacto.jpg" | static_url | img_tag | a_tag(settings.banner_contacto_url) }}
        {% else %}
            {{ "banner-contacto.jpg" | static_url | img_tag }}
        {% endif %}
    </div>
    {% endif %}
    <!-- banner-->
