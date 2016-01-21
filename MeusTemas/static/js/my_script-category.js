$("select.sort-by").on("change",ordenar);

function ordenar(){
    var sort_by = $(".sort-by").val();
    var url_completa = window.location.href;
    var url_array = url_completa.split('?sort_by');
    var url =  url_array[0];
    
    $(window.document.location).attr('href',url+"?sort_by="+sort_by);
}