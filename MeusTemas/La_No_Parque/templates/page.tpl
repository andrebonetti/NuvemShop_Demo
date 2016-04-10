<section class="quem-somos" id="atual-page">

    <h1 class="">{{ page.name }}</h1>

    {% if page.name == "Quem Somos" %}
    
    {{ "img/Quem_Somos.png" | static_url | img_tag("Loja de Brinquedos Educativos Quem Somos")}}

    {% endif %}

    {{ page.content }}

</section>
