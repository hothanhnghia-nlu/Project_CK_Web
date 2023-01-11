$('#frm').validate({
    rules: {
        // Thông tin người dùng
        name: "required",
        email: {
            required: true,
            email: true
        },
        phone: "required",
        address: "required",
        subject: "required",
        content: "required",
        rating: "required",

        // Thông tin sản phẩm
        namep: "required",
        id_cate: {
            required: true
        },
        quantity: "required",
        price: "required",
        discount: "required",
        discription: "required"

    }, messages: {
        // Thông tin người dùng
        name: "Vui lòng nhập tên của bạn",
        email: {
            required: "Vui lòng nhập email của bạn",
            email: "Vui lòng nhập email hợp lệ"
        },
        phone: "Vui lòng nhập số điện thoại của bạn",
        address: "Vui lòng nhập địa chỉ của bạn",
        subject: "Vui lòng nhập tên sản phẩm",
        content: "Vui lòng nhập nội dung",
        rating: "Vui lòng chọn đánh giá",

        // Thông tin sản phẩm
        namep: "Vui lòng nhập tên sản phẩm",
        id_cate: "Vui lòng chọn danh mục",
        quantity: "Vui lòng nhập số lượng",
        price: "Vui lòng nhập giá tiền",
        discount: "Vui lòng nhập giá tiền giảm",
        discription: "Vui lòng nhập thông số"
    },
    submitHandler: function (form) {
        alert("Dữ liệu đã được lưu!");
        form.submit();
    }
});