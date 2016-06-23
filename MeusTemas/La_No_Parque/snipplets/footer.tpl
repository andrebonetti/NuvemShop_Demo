<footer>
        	
                <div class="foot foot-1">
                    <div class="foot-content">

                        <h5>Navegação</h5>

                        <nav>
                            <ul class="foot-nav">
                                {% snipplet "navigation-foot.tpl" %}
                            </ul>
                        </nav>

                    </div>
                </div>
                
                <div class="foot foot-2">
                    <div class="foot-content">
                        
                        <h5>Formas De pagamento</h5>
                        <div class="pagamentos">
                            
                            <div class="box">
                                {{ "img/Icones_Pagamento/cartoes_de_credito.png" | static_url | img_tag("Instagran La No Parque", {'class' : "hover"})}}
                                <span>Cartões de crédito</span>
                            </div>
                            <div class="box">
                                {{ "img/Icones_Pagamento/transferencia.png" | static_url | img_tag("Instagran La No Parque", {'class' : "hover"})}}
                                <span>Débito bancário</span>
                            </div>
                            <div class="box">
                                {{ "img/Icones_Pagamento/boleto.png" | static_url | img_tag("Instagran La No Parque", {'class' : "hover"})}}
                                <span>Boleto bancário</span>
                            </div>
                            <div class="box">
                                {{ "img/Icones_Pagamento/pag_seguro.png" | static_url | img_tag("Instagran La No Parque", {'class' : "hover"})}}
                                <span>Carteira eletrônica (PagSeguro)</span>
                            </div>
                            <div class="box">
                                {{ "img/Icones_Pagamento/deposito.png" | static_url | img_tag("Instagran La No Parque", {'class' : "hover"})}}
                                <span>Depósito em conta</span>
                            </div>
                            
                        </div>
                        
                    </div>

                </div>
                <div class="foot foot-3">
                    <div class="foot-content">

                        <h5>Formas de Entrega</h5>
                        <div class="formas_entrega">
                            {{ "img/Frete/correios.png" | static_url | img_tag("Frete Correios Entrega", {'class' : "hover"})}} 
                            {{ "img/Frete/sedex.png" | static_url | img_tag("Frete Entrega Sedex", {'class' : "hover"})}}
                            {{ "img/Frete/pag.png" | static_url | img_tag("Frete Entrega PAC", {'class' : "hover"})}}
                        </div>
                        
                    </div>
                </div>

                <div class="foot foot-4">
                    <div class="foot-content">

                        <h5>Contato</h5>

                            {% if store.phone %}
                                <p><strong>Telefone: </strong></p>
                                <p>{{ store.phone }}</p>
                            {% endif %}
                            {% if store.address %}
                                <p><strong>Endereço: </strong></p>
                                <p>{{ store.address }}</p>
                            {% endif %}
                            {% if store.email %}
                                <p><strong>E-mail: </strong></p>
                                <p>{{ store.email | mailto }}</p>
                            {% endif %}
                        
                        <h5>Redes Sociais</h5>
                        
                            <div class="sociais">

                                <div class="social">
                                    <a href="https://www.facebook.com/lanoparque">
                                        {{ "img/Face_2.png" | static_url | img_tag("Facebook La No Parque", {'class' : "link"}) }}
                                        {{ "img/Face_2.png" | static_url | img_tag("Facebook La No Parque", {'class' : "hover"})}}
                                        <p class="facebook">Facebook</p>
                                    </a>                                   
                                </div>
                                <div class="social">
                                    <a href="https://instagram.com/lanoparque">
                                        {{ "img/Instagran_2.png" | static_url | img_tag("Instagran La No Parque", {'class' : "link"})}}
                                        {{ "img/Instagran_2.png" | static_url | img_tag("Instagran La No Parque", {'class' : "hover"})}}
                                        <p class="insta">Instagram</p>
                                    </a>                                    
                                </div>
                                <div class="social" style="display:none;">
                                    <a href="https://twitter.com/lanoparque">
                                        {{ "img/Twitter.png" | static_url | img_tag("Twitter La No Parque", {'class' : "link"})}}
                                        {{ "img/Twitter_hover.png" | static_url | img_tag("Twitter La No Parque", {'class' : "hover"})}}
                                        <p class="twitter">Twitter</p>
                                    </a>     
                                </div>

                            </div>

                    </div>
                                       
                </div>

            </footer>

            <div class="end-page">
                <p>{{ "Copyright {1} - {2}. Todos los derechos reservados." | translate( (store.business_name ? store.business_name : store.name) ~ (store.business_id ? ' - ' ~ store.business_id : ''), "now" | date('Y') ) }}</p>
                <div class="top-page btn btn-default">
                    {{ "Subir" | translate }}
                </div>
            </div>  
        
        </div> 
        