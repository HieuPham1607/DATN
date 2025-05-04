using Microsoft.AspNetCore.Mvc;
using WebBanGiayAdidas.Models;
using Microsoft.AspNetCore.Http;
using System.Linq;
using System.Text.Json;

namespace WebBanGiayAdidas.Controllers
{
	public class ShopCartController : Controller
	{
		private readonly WebBanGiayAdidasContext _context;

		public ShopCartController(WebBanGiayAdidasContext context)
		{
			_context = context;
		}

		public IActionResult Index()
		{
			var cart = HttpContext.Session.GetObjectFromJson<ShopCart>("Cart") ?? new ShopCart();
			return View(cart);
		}
	
        [HttpGet]
        public IActionResult GetCartQuantity()
        {
            var cart = HttpContext.Session.GetObjectFromJson<ShopCart>("Cart") ?? new ShopCart();
            var totalQuantity = cart.GetTotalQuantity();
            return Json(new { success = true, totalQuantity });
        }

        [HttpPost]
        public IActionResult AddToCart(int id, int quantity)
        {
            var product = _context.Products.FirstOrDefault(p => p.Id == id);
            if (product == null)
            {
                return Json(new { success = false, message = "Sản phẩm không tồn tại." });
            }

            var item = new ShopCartItem
            {
                Id = product.Id,
                Name = product.Title,
                Alias = product.Alias,
                CateName = product.ProductCategory?.Title,
                Img = product.Image,
                Price = product.PriceSale ?? 0,
                Quantity = quantity,
                TotalPrice = (product.PriceSale ?? 0) * quantity
            };

            // Lấy giỏ hàng từ session (hoặc khởi tạo mới nếu chưa có)
            var cart = HttpContext.Session.GetObjectFromJson<ShopCart>("Cart") ?? new ShopCart();
            cart.AddToCart(item, quantity);
            HttpContext.Session.SetObjectAsJson("Cart", cart);  // Lưu lại giỏ hàng vào Session

            // Cập nhật số lượng giỏ hàng
            var totalQuantity = cart.GetTotalQuantity();

            return Json(new { success = true, message = "Đã thêm vào giỏ hàng!", totalQuantity });
        }

        [HttpPost]
		public IActionResult Remove(int id)
		{
			var cart = HttpContext.Session.GetObjectFromJson<ShopCart>("Cart") ?? new ShopCart();
			cart.Remove(id);
			HttpContext.Session.SetObjectAsJson("Cart", cart);

			return Json(new { success = true, message = "Đã xóa sản phẩm khỏi giỏ hàng." });
		}

		[HttpPost]
		public IActionResult Update(int id, int quantity)
		{
			var cart = HttpContext.Session.GetObjectFromJson<ShopCart>("Cart") ?? new ShopCart();
			cart.Update(id, quantity);
			HttpContext.Session.SetObjectAsJson("Cart", cart);

			return Json(new { success = true, message = "Đã cập nhật số lượng." });
		}

		[HttpPost]
		public IActionResult ClearCart()
		{
			HttpContext.Session.Remove("Cart");
			return Json(new { success = true, message = "Đã xóa toàn bộ giỏ hàng." });
		}
	}
}
