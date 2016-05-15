/* MASCARAS */
//$("#shipping-zipcode").mask("99999-999");

/* ---------- EXTEND/HIDE DESCRICAO - PRODUTO ---------- */

/* --- VARIAVEIS --- */
    var altura_hide = "100";
    var altura_total = $(".description").outerHeight();

    var altura_asideCategorias = $(".categorias_produtos").outerHeight(); 
    var altura_produtoContent = $(".produto-detalhes").outerHeight() - (altura_total - 100); 

/* --- PAGE LOAD --- */

    /* --- VALIDA BOTÃO EXTEND --- */
    $(".hide-descricao").hide();
    $(".description").css("height",altura_hide);
    
    if(altura_total <= altura_hide){
        $(".extend-descricao").hide();
    }

    /* --- VALIDA ALTURA PRODUTO CONTENT --- */
    if(altura_asideCategorias > altura_produtoContent)
    {
        altura_asideCategorias = altura_asideCategorias - 50; 
        $(".produto-detalhes").css("height",altura_asideCategorias + "px");
    }
    
    
/* --- EVENTOS --- */
    $(".extend-descricao").click(function(){show_descricao();});
    $(".hide-descricao").click(function(){hide_descricao();});
    
/* --- FUNCTIONS --- */
    function show_descricao(){
        $(".extend-descricao").hide();
        $(".hide-descricao").show()

        $(".description").animate({height:altura_total + "px"}, 500);
    }

    function hide_descricao(){
        $(".hide-descricao").hide();
        $(".extend-descricao").show();

        $(".description").animate({height:altura_hide}, 500);
    }
 
