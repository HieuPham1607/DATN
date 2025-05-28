using Microsoft.AspNetCore.Mvc;
using WebBanGiayAdidas.Models;
using Microsoft.AspNetCore.Http;
using System.Linq;
using System.Text.Json;
using Microsoft.AspNetCore.Authorization;
using Microsoft.EntityFrameworkCore;
using System.Drawing;

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
        public IActionResult FormCheckOut()
        {
            var cart = HttpContext.Session.GetObjectFromJson<ShopCart>("Cart") ?? new ShopCart();
            ViewBag.Cart = cart;
            return View(new Order()); 
        }
        public IActionResult Success()
        {
            return View();
        }
		[HttpPost]
		[ValidateAntiForgeryToken]
		public IActionResult FormCheckOut(Order order)
		{
			var cart = HttpContext.Session.GetObjectFromJson<ShopCart>("Cart");

			if (cart == null || !cart.items.Any())
			{
				ModelState.AddModelError("", "Giỏ hàng trống.");
				ViewBag.Cart = cart;
				return View(order);
			}
			// Lấy user ID từ session
			var userId = HttpContext.Session.GetInt32("UserId");
			if (userId != null)
			{
				order.UserId = userId.Value;
			}

			// Gán thêm dữ liệu
			order.TotalAmount = cart.GetTotalPrice();
			order.Quantity = (int?)cart.GetTotalQuantity();
			order.OrderCode = "OD" + DateTime.Now.Ticks;
			order.CreateDate = DateTime.Now;

			_context.Orders.Add(order);
			_context.SaveChanges();

			// Lưu chi tiết đơn hàng + cập nhật tồn kho
			foreach (var item in cart.items)
			{
				var detail = new OrderDetail
				{
					OrderId = order.Id,
					ProductId = item.Id,
					Quantity = item.Quantity,
					Price = item.Price,
					TotalPrice = item.TotalPrice,
					Size = item.Size 
				};
				_context.OrderDetails.Add(detail);

				//// ✅ Giảm tồn kho theo từng Size
				var productSize = _context.ProductSizes.FirstOrDefault(ps => ps.ProductId == item.Id && ps.Size == item.Size);
				if (productSize != null)
				{
					productSize.Quantity -= item.Quantity;

					if (productSize.Quantity < 0) // tránh âm
						productSize.Quantity = 0;
				}
			}

			_context.SaveChanges(); // lưu cả OrderDetails và cập nhật tồn kho

			HttpContext.Session.Remove("Cart");

			return RedirectToAction("Success");
		}
		//lưu lại số lượng trong giỏ hàng
		[HttpGet]
        public IActionResult GetCartQuantity()
        {
            var cart = HttpContext.Session.GetObjectFromJson<ShopCart>("Cart") ?? new ShopCart();
            int productCount = cart.items.Count;
            return Json(new { success = true, totalQuantity = productCount });
        }

		[HttpPost]
		public IActionResult AddToCart(int id, int quantity, string size)
		{
			var product = _context.Products.FirstOrDefault(p => p.Id == id);
			if (product == null)
			{
				return Json(new { success = false, message = "Sản phẩm không tồn tại." });
			}

			// Tìm productSize theo size gửi lên
			var productSize = _context.ProductSizes.FirstOrDefault(ps => ps.ProductId == id && ps.Size == size);

			// Nếu không tồn tại size đó, lấy size đầu tiên trong danh sách sản phẩm
			if (productSize == null)
			{
				productSize = _context.ProductSizes.FirstOrDefault(ps => ps.ProductId == id);
				if (productSize == null)
				{
					return Json(new { success = false, message = "Sản phẩm không có size nào trong kho." });
				}
				// Gán lại size thành size đầu tiên lấy được
				size = productSize.Size;
			}

			if (productSize.Quantity < quantity)
			{
				return Json(new { success = false, message = "Số lượng sản phẩm không đủ trong kho." });
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
				Size = size,
				TotalPrice = (product.PriceSale ?? 0) * quantity
			};

			var cart = HttpContext.Session.GetObjectFromJson<ShopCart>("Cart") ?? new ShopCart();
			cart.AddToCart(item, quantity);
			HttpContext.Session.SetObjectAsJson("Cart", cart);

			var totalQuantity = cart.items.Count;

			return Json(new { success = true, message = "Đã thêm vào giỏ hàng!", totalQuantity });
		}

		[HttpPost]
        public IActionResult Remove(int id, string size)
        {
            var cart = HttpContext.Session.GetObjectFromJson<ShopCart>("Cart") ?? new ShopCart();
            cart.Remove(id, size);
            HttpContext.Session.SetObjectAsJson("Cart", cart);

            var total = cart.GetTotalPrice();

            return Json(new
            {
                success = true,
                message = "Đã xóa sản phẩm khỏi giỏ hàng.",
                totalPrice = total
            });
        }


        [HttpPost]
        public IActionResult Update(int id, string size, int quantity)
        {
            var product = _context.Products.FirstOrDefault(p => p.Id == id);
            if (product == null)
            {
                return Json(new { success = false, message = "Sản phẩm không tồn tại." });
            }

            var productSize = _context.ProductSizes.FirstOrDefault(ps => ps.ProductId == id && ps.Size == size);
            if (productSize == null || productSize.Quantity < quantity)
            {
                return Json(new { success = false, message = "Số lượng sản phẩm không đủ trong kho." });
            }

            var cart = HttpContext.Session.GetObjectFromJson<ShopCart>("Cart") ?? new ShopCart();
            cart.Update(id, size, quantity);
            HttpContext.Session.SetObjectAsJson("Cart", cart);

            // Lấy lại item để trả về
            var updatedItem = cart.items.FirstOrDefault(i => i.Id == id && i.Size == size);
            var itemTotal = updatedItem?.TotalPrice ?? 0;
            var cartTotal = cart.GetTotalPrice();

            return Json(new
            {
                success = true,
                itemTotal,
                cartTotal
            });
        }

        [Authorize]
		public async Task<IActionResult> MyOrders()
		{
			var userId = HttpContext.Session.GetInt32("UserId");

			if (userId == null)
				return RedirectToAction("Login", "Account");

			var orders = await _context.Orders
				.Where(o => o.UserId == userId)
				//.OrderByDescending(o => o.OrderDate)
				.ToListAsync();

			return View(orders);
		}

		// Hiển thị chi tiết đơn hàng
		[Authorize]
		public async Task<IActionResult> OrderDetail(int id)
		{
			var userId = HttpContext.Session.GetInt32("UserId");

			if (userId == null)
				return RedirectToAction("Login", "Account");

			var order = await _context.Orders
				.Include(o => o.OrderDetails)
				.ThenInclude(od => od.Product)
                .FirstOrDefaultAsync(o => o.Id == id && o.UserId == userId);

            if (order == null)
				return NotFound();

			return View(order);
		}
		[HttpPost]
		public IActionResult ClearCart()
		{
			HttpContext.Session.Remove("Cart");
			return Json(new { success = true, message = "Đã xóa toàn bộ giỏ hàng." });
		}
	}
}
