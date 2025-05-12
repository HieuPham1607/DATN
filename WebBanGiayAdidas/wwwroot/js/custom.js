// Khai báo biến menuActive
var menuActive = false;

function initMenu() {
    // Menu 3
    var hamburger3 = $('.hamburger_container3');
    var menu3 = $('.hamburger_menu3');
    var hamburgerClose3 = $('.hamburger_close3');
    var fsOverlay3 = $('.fs_menu_overlay3');

    if (hamburger3.length) {
        hamburger3.on('click', function () {
            if (!menuActive) {
                openMenu(menu3, fsOverlay3);
            }
        });
    }

    if (fsOverlay3.length) {
        fsOverlay3.on('click', function () {
            if (menuActive) {
                closeMenu(menu3, fsOverlay3);
            }
        });
    }

    if (hamburgerClose3.length) {
        hamburgerClose3.on('click', function () {
            if (menuActive) {
                closeMenu(menu3, fsOverlay3);
            }
        });
    }

    // Dropdown menu toggle
    if ($('.menu_item').length) {
        var items = document.getElementsByClassName('menu_item');
        for (var i = 0; i < items.length; i++) {
            if (items[i].classList.contains("has-children")) {
                items[i].onclick = function () {
                    this.classList.toggle("active");
                    var panel = this.children[1];
                    if (panel.style.maxHeight) {
                        panel.style.maxHeight = null;
                    }
                    else {
                        panel.style.maxHeight = panel.scrollHeight + "px";
                    }
                }
            }
        }
    }
}

function openMenu(menuElement, overlayElement) {
    menuElement.addClass('active');
    overlayElement.css('pointer-events', "auto");
    menuActive = true;
}

function closeMenu(menuElement, overlayElement) {
    menuElement.removeClass('active');
    overlayElement.css('pointer-events', "none");
    menuActive = false;
}

$(document).ready(function () {
    initMenu();  // Khởi tạo menu khi trang đã tải
});
