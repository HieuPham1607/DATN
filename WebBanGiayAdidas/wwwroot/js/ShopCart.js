$(document).ready(function () {
    // 1. Lấy số lượng giỏ hàng từ session
    function loadCartCount() {
        $.ajax({
            url: '/ShopCart/GetCartQuantity',
            type: 'GET',
            success: function (response) {
                if (response.success) {
                    $('#checkout_items').text(response.totalQuantity);
                }
            },
            error: function () {
                console.error('Lỗi khi lấy số lượng giỏ hàng');
            }
        });
    }
    loadCartCount();

    // 2. Thêm sản phẩm vào giỏ
    $('body').on('click', '.btnAddToCart', function (e) {
        e.preventDefault();

        var id = $(this).data('id');
        var quantity = 1;
        var tQuantity = $('#quantity_value').text();
        if (tQuantity) {
            quantity = parseInt(tQuantity);
        }

        $.ajax({
            url: '/ShopCart/AddToCart',
            type: 'POST',
            data: { id: id, quantity: quantity },
            success: function (response) {
                if (response.success) {
                    $('#checkout_items').text(response.totalQuantity);
                    alert(response.message);
                } else {
                    alert(response.message);
                }
            },
            error: function () {
                alert("Có lỗi xảy ra khi thêm sản phẩm vào giỏ hàng.");
            }
        });
    });

    // 3. Xóa một sản phẩm trong giỏ
    $('body').on('click', '.btnRemoveFromCart', function (e) {
        e.preventDefault();
        var btn = $(this);
        var id = btn.data('id');

        if (!confirm('Bạn có chắc muốn xóa sản phẩm này khỏi giỏ hàng?')) return;

        $.ajax({
            url: '/ShopCart/Remove',
            type: 'POST',
            data: { id: id },
            success: function (response) {
                if (response.success) {
                    // Xóa dòng trong bảng
                    btn.closest('tr').remove();

                    // Nếu không còn mặt hàng nào, hiển thị thông báo trống giỏ
                    if ($('tbody tr').length === 0) {
                        $('.main_content').html('<p>Giỏ hàng của bạn hiện tại trống.</p>');
                    }

                    // Tải lại số lượng giỏ hàng và tổng tiền
                    loadCartCount();
                } else {
                    alert(response.message);
                }
            },
            error: function () {
                alert('Có lỗi xảy ra khi xóa sản phẩm.');
            }
        });
    });

    // 4. Xóa toàn bộ giỏ hàng
    $('#btnClearCart').on('click', function (e) {
        e.preventDefault();
        if (!confirm('Bạn có chắc muốn xóa toàn bộ giỏ hàng?')) return;

        $.ajax({
            url: '/ShopCart/ClearCart',
            type: 'POST',
            success: function (response) {
                if (response.success) {
                    // Load lại trang để hiển thị giỏ rỗng
                    location.reload();
                } else {
                    alert(response.message || 'Xóa giỏ hàng thất bại');
                }
            },
            error: function () {
                alert('Có lỗi xảy ra khi xóa giỏ hàng.');
            }
        });
    });
});
