<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:fb="http://www.facebook.com/2008/fbml" xmlns:og="http://opengraphprotocol.org/schema/">
    
    <head>

    <!--------------------------------------- snipplet "head.tpl" \/ --------------------------------------->
    {% snipplet "head.tpl" %}
            
    </head>

    <body itemscope itemtype="http://schema.org/WebPage" itemid="body">
        
        <!--------------------------------------- snipplet "social_JS.tpl" \/ --------------------------------------->
        {% snipplet "social_JS.tpl" %}
                
        <!--<div id="{% if template == "404" %}missing{% else %}{{ template }}{% endif %}" class="container">-->
            
            {% if template == "404" %}

                <!-- if template == "404" -->  
                {% template_content %}

            {% else %}
              
                <!--------------------------------------- snipplet "header.tpl" \/ --------------------------------------->
                {% snipplet "header.tpl" %}
         
                {% if template == "home" %}
                    <!-- if template == "home" -->
                    <!--------------------------------------- slide-show_home.tpl \/ --------------------------------------->
                    {% snipplet "slide-show_home.tpl" %}
                {% endif %} 
                
                <!--------------------------------------- snipplet "nav.tpl" \/ --------------------------------------->
                {% snipplet "nav.tpl" %}
            
                <!--------------------------------------- TEMPLATE CONTENT \/ --------------------------------------->
                {% template_content %}
            
                <!--------------------------------------- snipplet "footer.tpl" \/ --------------------------------------->
                {% snipplet "footer.tpl" %}
            
            {% endif %}

        <!--</div>-->

        <!--------------------------------------- snipplet "scripts.tpl" \/ --------------------------------------->
        {% snipplet "scripts.tpl" %}
                
    </body>
    
</html>
