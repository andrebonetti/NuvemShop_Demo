{% if page.name == "Quem Somos" %}

    <section class="sobre">

        <h1>{{ page.name }}</h1>

        {{ "img/balancas_bonetti-loja.jpg" | static_url | img_tag("empresa balanças bonetti assistencia tecnica")}}

        <div class="text">            
            {{ page.content }}             
        </div>

    </section> 

{% endif %} 

{% if page.name == "Serviços" %}

    <section class="servicos">
            
                <h1>{{ page.name }}</h1>
                
                <div class="boxes">
                    
                    <div class="box">
                        
                        <div class="img-content">
                            {{ "img/Servicos/portfolio12-th.jpg" | static_url | img_tag("empresa balanças bonetti assistencia tecnica")}}
                        </div>    
                        <h2>Manutenção e Ajuste de Balanças</h2>
                        
                        <p>A Balanças Bonetti dispõe de oficina equipada para realizar manutenção e ajuste de balanças. É autorizada pelo INMETRO para realizar manutenção de produtos das marcas FILIZOLA, TOLEDO , CAF, R.BAIÃO E SKYMSEN</p>
                        
                    </div>
                    
                    <div class="box">
                        
                        <div class="img-content">
                            {{ "img/Servicos/portfolio10-th.jpg" | static_url | img_tag("empresa balanças bonetti assistencia tecnica")}}
                        </div>  
                        <h2>Assistência Técnica Própria</h2>
                        
                        <p>Possuimos assistência técnica própria, ampla, capacitada e continuamente atualizada para atender às necessidades de cada um dos clientes.</p>
                        
                    </div>
                    
                    <div class="box">
                        
                        <div class="img-content">
                            {{ "img/Servicos/portfolio5-th.jpg" | static_url | img_tag("empresa balanças bonetti assistencia tecnica")}}
                        </div>  
                        <h2>Compra e Venda de Balanças</h2>
                        
                        <p>Temos uma variedade de produtos altamente qualificada e selecionada, para atender as necessidades de cada cliente.</p>
                        
                    </div>
                    
                </div>
                          
        </section>    

{% endif %} 
