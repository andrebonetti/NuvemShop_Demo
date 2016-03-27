<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:fb="http://www.facebook.com/2008/fbml" xmlns:og="http://opengraphprotocol.org/schema/">
    
    <head>

    <!--------------------------------------- snipplet "head.tpl" \/ --------------------------------------->
    {% snipplet "head.tpl" %}
            
    </head>

    <body itemscope itemtype="http://schema.org/WebPage" itemid="body">
        
        <!--------------------------------------- snipplet "social_JS.tpl" \/ --------------------------------------->
        {% snipplet "social_JS.tpl" %}
                
        <div id="{% if template == "404" %}missing{% else %}{{ template }}{% endif %}" class="container">
            
            {% if template == "404" %}

                <!-- if template == "404" -->  
                {% template_content %}

            {% else %}
              
                <!--------------------------------------- snipplet "header.tpl" \/ --------------------------------------->
                {% snipplet "header.tpl" %}
            
            
                <!--------------------------------------- snipplet "footer.tpl" \/ --------------------------------------->
                {% snipplet "footer.tpl" %}
            
            {% endif %}

        </div>

        <!--------------------------------------- snipplet "scripts.tpl" \/ --------------------------------------->
        {% snipplet "scripts.tpl" %}
                
    </body>
    
</html>
