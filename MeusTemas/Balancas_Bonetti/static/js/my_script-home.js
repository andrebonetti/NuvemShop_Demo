/* --- EXTEND CATEGORIAS ---*/
var altura_total=$(".categorias").height();
altura_total = parseInt(altura_total) + 200; 
$(".hide-categorias").hide();

var altura_hide = "225px";

$(".categorias").css("height",altura_hide);

var show_categorias = function(){
    $(this).hide();
    $(".hide-categorias").show()
    $(this).addClass("hide_cetegorias");
    $(".categorias").animate({height:"600px"}, 500);
}

var hide_categorias = function(){
    $(".hide-categorias").hide();
    $(".extend-categorias").show();
    $(".categorias").animate({height:altura_hide}, 500);
}

$(".extend-categorias").on("click",show_categorias);
$(".hide-categorias").on("click",hide_categorias);

/*ALTURA RECENTES/PROMOCAO*/
var altura_emBreve = $(".recentes").outerHeight()
var altura_emPromocao = $(".em-breve").outerHeight()

if(parseFloat(altura_emBreve) >  parseFloat(altura_emPromocao)){
    $(".em-breve").css("height",altura_emBreve+"px");
}

if(parseFloat(altura_emPromocao) >  parseFloat(altura_emBreve)){
    $(".recentes").css("height",altura_emPromocao+"px");
}






