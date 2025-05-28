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

        // Lấy size đang chọn
        var selectedSizeBtn = $('.size-btn.active');
        if (selectedSizeBtn.length === 0) {
            // Nếu chưa chọn size, lấy size đầu tiên
            selectedSizeBtn = $('.size-btn').first();
        }
        var size = selectedSizeBtn.text().trim();

        $.ajax({
            url: '/ShopCart/AddToCart',
            type: 'POST',
            data: { id: id, quantity: quantity, size: size },
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

    // 3. Xóa một sản phẩm trong giỏ - gửi cả id và size
    $('body').on('click', '.btnRemoveFromCart', function (e) {
        e.preventDefault();
        var btn = $(this);
        var id = btn.data('id');
        var size = btn.data('size');

        if (!confirm('Bạn có chắc muốn xóa sản phẩm này khỏi giỏ hàng?')) return;

        $.ajax({
            url: '/ShopCart/Remove',
            type: 'POST',
            data: { id: id, size: size },
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

    // 5. Cập nhật số lượng sản phẩm (khi thay đổi input) - gửi id + size + quantity
    $('body').on('change', '.quantity-input', function () {
        var input = $(this);
        var id = input.data('id');
        var size = input.data('size');
        var qty = parseInt(input.val());

        if (qty < 1 || isNaN(qty)) {
            alert('Số lượng phải >= 1');
            input.val(1);
            qty = 1;
        }

        $.ajax({
            url: '/ShopCart/Update',
            type: 'POST',
            data: { id: id, size: size, quantity: qty },
            success: function (res) {
                if (res.success) {
                    var row = $('tr[data-id="' + id + '"][data-size="' + size + '"]');
                    row.find('.item-total').text(res.itemTotal.toLocaleString('vi-VN') + '₫');
                    $('#cart-total').text(res.cartTotal.toLocaleString('vi-VN') + '₫');

                    // Cập nhật lại số lượng hiện tại trong giỏ
                    input.attr('data-current', qty);

                    loadCartCount();
                } else {
                    alert(res.message);
                    var oldQty = input.attr('data-current');
                    input.val(oldQty);
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
        var size = btn.data('size');
        var input = $('input.quantity-input[data-id="' + id + '"][data-size="' + size + '"]');
        var qty = parseInt(input.val()) + 1;
        input.val(qty).trigger('change');
    });

    // 7. Nút giảm số lượng
    $('body').on('click', '.btn-decrease', function () {
        var btn = $(this);
        var id = btn.data('id');
        var size = btn.data('size');
        var input = $('input.quantity-input[data-id="' + id + '"][data-size="' + size + '"]');
        var qty = parseInt(input.val());

        if (qty > 1) {
            qty--;
            input.val(qty).trigger('change');
        } else {
            alert('Số lượng phải >= 1');
        }
    });
});
