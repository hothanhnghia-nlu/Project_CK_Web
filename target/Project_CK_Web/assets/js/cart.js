$(document).ready(function ($) {

    // Cập nhật giá sp
    $('.amount').change(function () {
        var soluong = $(this).val();
        var gia = $(this).closest('tr').find('.price').attr('data-value');

        var tong = soluong * parseInt(gia);
        var format = tong.toFixed(0).replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1.").toString();
        $(this).closest('tr').find('.price').html(format + "₫");
    })


    //Cập nhật tổng tiền
    $('#update').click(function () {
        // Tính tổng tiền
        var total = 0;
        $('.amount').each(function () {
            var price = parseFloat($(this).closest('tr').find('.price').text());
            console.log(price);
            total += price;
        });
        // Cập nhật tổng tiền vào thẻ HTML
        var formatTongtien = total.toFixed(6).replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1.").toString();
        $('.total').html(formatTongtien + "₫");
    })

});