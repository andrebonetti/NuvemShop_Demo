               <div id="content" class="clear">
                    {% if template == "cart" %}
                        <!-- if template == "cart" -->  
                        <!-- template_content \/ -->  
                        {% template_content %}
                    {% else %}
                        <div id="main">
                            <!-- template_content \/ -->
                            {% template_content %}
                        </div>
                        <!-- snipplet "sidebar.tpl" \/ -->
                        {% snipplet "sidebar.tpl" %}
                    {% endif %}
                </div>


                <div id="footer" class="clear">

                    {% if settings.show_footer_fb_like_box and store.facebook %}
                        <!-- if settings.show_footer_fb_like_box and store.facebook -->
                        <div style="margin:10px 0;">
                            <!-- store.facebook | fb_page_plugin(960,190) -->
                            {{ store.facebook | fb_page_plugin(960,190) }}
                        </div>
                    {% endif %}


                        {#
                            La leyenda que aparece debajo de esta linea de código debe mantenerse
                            con las mismas palabras y con su apropiado link a Tienda Nube;
                            como especifican nuestros términos de uso: http://www.tiendanube.com/terminos-de-uso .
                            Si quieres puedes modificar el estilo y posición de la leyenda para que se adapte a
                            tu sitio. Pero debe mantenerse visible para los visitantes y con el link funcional.

                            Os créditos que aparece debaixo da linha de código deverá ser mantida com as mesmas
                            palavras e com seu link para Nuvem Shop; como especificam nossos Termos de Uso:
                            http://www.nuvemshop.com.br/termos-de-uso. Se você quiser poderá alterar o estilo
                            e a posição dos créditos para que ele se adque ao seu site. Porém você precisa
                            manter visivél e com um link funcionando.
                        #}

                    <p>{{"Copyright" | translate }} &copy; {{ "now" | date("Y") }} {{ store.business_name ? store.business_name : store.name }} {{ store.business_id }}. {{ powered_by_link }}.</p>

                    <div class="right">
                        <div class="payments">
                            {% for payment in settings.payments %}
                            {{ payment | payment_logo | img_tag('', {'height' : 29}) }}
                            {% endfor %}
                        </div>
                        <div class="shipping">
                            {% for shipping in settings.shipping %}
                            {{ shipping | shipping_logo | img_tag('', {'height' : 29}) }}
                            {% endfor %}
                            {% if store.afip %}
                                <div class="afip">
                                {{ store.afip | raw }}
                                </div>
                            {% endif %}
                        </div>
                        <div class="seals">
                            {% if ebit %}
                            {{ ebit }}
                            {% endif %}
                            {% if siteforte %}
                            {{ siteforte }}
                            {% endif %}
                        </div>
                    </div>

                </div>