$("select.sort-by").on("change",ordenar);

function ordenar(){
    var sort_by = $(".sort-by").val();
    var url_completa = window.location.href;
    var url_array = url_completa.split('?sort_by');
    var url =  url_array[0];
    
    $(window.document.location).attr('href',url+"?sort_by="+sort_by);
}

/* --- LISTAR VARIANTES --- */
var Lista_Filtros = [];

$( ".lista_opcoes_variante" ).each(function( index ) {

    var Variante = $(this).attr("name");
    var HasVariante = false;
    
    for (i = 0; i < Lista_Filtros.length; i++) 
    {
        if(Lista_Filtros[i] == Variante)
        {
            HasVariante = true;
            break;
        }
    }
    
    if(HasVariante == false)
    {
        Lista_Filtros.push(Variante);
    }
});

/* --- LISTAR OPCOES --- */
for (i = 0; i < Lista_Filtros.length; i++) 
{
    var Lista_Opcoes = [];     
    var opcoes = "";
    
    var Filtro = Lista_Filtros[i];
    
    //alert(Filtro);
    
    $( "li."+Filtro).each(function( index ) {
        
        var itemOpcao = $(this).attr("name");
        var HasOpcao = false;  
    
        //alert("HTML - " + itemOpcao);
        
        for (n = 0; n < Lista_Opcoes.length; n++) 
        {
            var Opcao = Lista_Opcoes[n];
            
            //alert("Lista Opcoes ARRAY - " + Opcao);
            if(Opcao == itemOpcao)
            {
                //alert("existe opcao - " + itemOpcao);
                HasOpcao = true;
                break;
            }
        }
        
        if(HasOpcao == false)
        {
            //alert("Adiciona Opcao - " + itemOpcao)
            Lista_Opcoes.push(itemOpcao);
        }
    });
        
    for (o = 0; o < Lista_Opcoes.length; o++) 
    {
        var Opcao = Lista_Opcoes[o];
        
        opcoes = opcoes + "<a href='#' title='filtro_"+Filtro+"' name='"+Filtro+"-"+Opcao+"' class='opcao_filtro filtro_"+Filtro+"'>"+Opcao+"</a>";      
    }
    
    var Head_Base = "<div class='categorias_produtos filtros_produtos variante_"+Filtro+"'>";
    var Nome_Filtro = "<h2>"+Filtro+"</h2>"
    var Opcao_LimparFiltros = "<a href='#' title='filtro_"+Filtro+"' class='limpa_filtro limpaFiltro_"+Filtro+"'>Limpar Filtros de - "+Filtro+"</a>"
    var Footer_Base = "</div>";
    
    var Conteudo = Head_Base + Nome_Filtro + opcoes + Opcao_LimparFiltros + Footer_Base;
    
    $(".produtos").append(Conteudo);
}

/* --- FILTRAR PRODUTOS --- */
$(".opcao_filtro").click(function(){
    
    //Verifica Qual o Filtro Atual
    var Tipo_Filtro = $(this).attr("title");
    
    //Desativa todas as Opcoes do atual Tipo de Filtro
    $("."+Tipo_Filtro).each(function( index ) {
        $(this).removeClass("opcao_ativa");
    });
    
    //Ativa Obção Selecionada
    $(this).addClass("opcao_ativa");
    
    //Ativa Filtro Selecionado
    $(this).closest(".filtros_produtos").addClass("filtro_ativo");
    
    //Esconde Todos os Produtos
    $(".box").hide();
    
    //Esconde Paginação
    $(".pagination").hide();
    
    //Lista todos os Filtros Ativos
    var count_filtros = 0;
    $(".filtro_ativo").each(function( index ) {
        count_filtros++;
    });
    
    //Se houver só um tipo de filtro ativo ele só considera as opcoes ativas desse filtro
    if(count_filtros == 1)
    {
        //Lista todos os Filtros Ativos
        $(".opcao_ativa").each(function( index ) {

            var anchor = $(this).attr("name");

            $("."+anchor).closest(".box").show();

        });
    }
    if(count_filtros > 1){
        
        var Lista_Opcoes_Ativas = [];
        $(".filtro_ativo").each(function( index ) {
            
            var opcao_ativa = $(this).find(".opcao_ativa").attr("name") ;
            
            Lista_Opcoes_Ativas.push(opcao_ativa);
        });
        
        var primeira_opcaoFiltro = Lista_Opcoes_Ativas[0];
        
        //Lista todos os Produtos que tem filtro
        $("."+primeira_opcaoFiltro).each(function( index ) {

            var produto_atual = $(this).closest(".box");

            var HasTodasOpcoes = true;
            
            for (p = 0; p < Lista_Opcoes_Ativas.length; p++) 
            {
                var opcao_ativa_produto = Lista_Opcoes_Ativas[p];
                
                var opcao_Produto = produto_atual.find("."+opcao_ativa_produto);
                
                if (!( opcao_Produto.length )){
                    HasTodasOpcoes = false;
                }
                
            }
            
            if(HasTodasOpcoes == true)
            {
                produto_atual.show();
            }

        });
    }
    
    //Descobre Altura de todos os Asides
    var altura_asideCategorias = 0;
    
    $(".categorias_produtos").each(function( index ) {
        
        var Altura = $(this).outerHeight();     
    
        altura_asideCategorias = altura_asideCategorias + Altura;
    });
    
    //Deixa altura da Div Produtos igual a do Aside
    $(".produto-content").css("height",altura_asideCategorias + "px");      
});

/* --- LIMPAR FILTROS --- */
$(".limpa_filtro").click(function(){
    
    //Verifica Qual o Filtro Atual
    var Tipo_Filtro = $(this).attr("title");
       
    //Desativa o Tipo de Filtro
    $(this).closest(".filtros_produtos").removeClass("filtro_ativo");
    
    //Desativa todas as Opcoes do atual Tipo de Filtro
    $("."+Tipo_Filtro).each(function( index ) {
        $(this).removeClass("opcao_ativa");
    });
    
    //Esconde todos os produtos
    $(".box").hide();
    
    //Refaz Filtro
    //Lista todos os Filtros Ativos
    var count = 0;
    $(".opcao_ativa").each(function( index ) {
        
        var anchor = $(this).attr("name");
    
        $("."+anchor).closest(".box").show();
        
        count++;
    });
      
    //Se não houver nenhum filtro mostra todos os produtos novamente
    if(count == 0)
    {
        //Mostra todos os produtos novamente
        $(".box").show();
        $(".produto-content").css("height","max");  
    }
          
});

