$(function () {
    var pageSize = 6; // Hiển thị 6 sản phẩm trên 1 trang
    showPage = function (page) {
        $(".contentPage").hide();
        $(".contentPage").each(function (n) {
            if (n >= pageSize * (page - 1) && n < pageSize * page)
                $(this).show();
        });
    }
    showPage(1);

    var totalRows = 30; // Tổng số sản phẩm hiển thị
    var btnPage = 3; // Số nút bấm hiển thị di chuyển trang
    var iTotalPages = Math.ceil(totalRows / pageSize);

    var obj = $('#pagination').twbsPagination({
        totalPages: iTotalPages,
        visiblePages: btnPage,
        onPageClick: function (event, page) {
            console.info(page);
            showPage(page);
        }
    });
    console.info(obj.data());
});