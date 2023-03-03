$(document).ready(function ($){
    $('.amount').change(function (){
        var soluong = $(this).val();
        var giatien = $(this).closest('tr').find('.price').attr('data-value');
        var tongtien = parseInt(soluong) * parseInt(giatien);
        var format = tongtien.toFixed(0).replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1.").toString();
        $(this).closest('tr').find('.price').html(format + "₫");
    })
});