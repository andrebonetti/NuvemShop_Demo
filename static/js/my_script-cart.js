$(".cancela-produto").on('click', function(event) {
    //alert($(this).closest("tr").text());
    $(this).closest("tr").slideUp(600);
});