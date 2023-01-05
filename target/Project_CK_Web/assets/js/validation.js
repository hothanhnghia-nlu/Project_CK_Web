$('#frm').validate({
    rules: {
        name: "required",
        email: {
            required: true,
            email: true
        },
        phone: "required",
        address: "required",
        subject: "required",
        content: "required"
    }, messages: {
        name: "Vui lòng nhập tên của bạn",
        email: {
            required: "Vui lòng nhập email của bạn",
            email: "Vui lòng nhập email hợp lệ"
        },
        phone: "Vui lòng nhập số điện thoại của bạn",
        address: "Vui lòng nhập địa chỉ của bạn",
        subject: "Vui lòng nhập tên sản phẩm",
        content: "Vui lòng nhập nội dung"
    },
    submitHandler: function (form) {
        alert("Dữ liệu đã được lưu!");
        form.submit();
    }
});