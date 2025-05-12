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
                    btn.closest('tr').remove();

                    if ($('tbody tr').length === 0) {
                        $('.main_content_cart').html('<p>Giỏ hàng của bạn hiện tại trống.</p>');
                    } else {
                        $('strong').text('Tổng cộng: ' + Number(response.totalPrice).toLocaleString('vi-VN') + '₫');
                    }

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

    // 5. Cập nhật số lượng sản phẩm (khi thay đổi input)
    $('body').on('change', '.quantity-input', function () {
        var input = $(this);
        var id = input.data('id');
        var qty = parseInt(input.val());

        if (qty < 1 || isNaN(qty)) {
            alert('Số lượng phải >= 1');
            input.val(1);
            qty = 1;
        }

        $.ajax({
            url: '/ShopCart/Update',
            type: 'POST',
            data: { id: id, quantity: qty },
            success: function (res) {
                if (res.success) {
                    var row = $('tr[data-id="' + id + '"]');
                    row.find('.item-total')
                        .text(res.itemTotal.toLocaleString('vi-VN') + '₫');

                    $('#cart-total')
                        .text(res.cartTotal.toLocaleString('vi-VN') + '₫');

                    loadCartCount();
                } else {
                    alert(res.message);
                }
            },
            error: function () {
                alert('Lỗi khi cập nhật số lượng.');
            }
        });
    });

    // 6. Nút tăng số lượng
    $('body').on('click', '.btn-increase', function () {
        var btn = $(this);
        var id = btn.data('id');
        var input = $('input.quantity-input[data-id="' + id + '"]');
        var qty = parseInt(input.val()) + 1;
        input.val(qty).trigger('change');
    });

    // 7. Nút giảm số lượng
    $('body').on('click', '.btn-decrease', function () {
        var btn = $(this);
        var id = btn.data('id');
        var input = $('input.quantity-input[data-id="' + id + '"]');
        var qty = parseInt(input.val());

        if (qty > 1) {
            qty--;
            input.val(qty).trigger('change');
        } else {
            alert('Số lượng phải >= 1');
        }
    });
});