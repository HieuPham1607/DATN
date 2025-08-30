using Microsoft.AspNetCore.Mvc;
using WebBanGiayAdidas.Models;
using Microsoft.AspNetCore.Http;
using System.Linq;
using System.Text.Json;
using Microsoft.AspNetCore.Authorization;
using Microsoft.EntityFrameworkCore;
using System.Drawing;
using Newtonsoft.Json;
using System.Text;
using System.Security.Cryptography;

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

            var userId = HttpContext.Session.GetInt32("UserId");
            if (userId != null)
            {
                order.UserId = userId.Value;
            }

            order.TotalAmount = cart.GetTotalPrice();
            order.Quantity = (int?)cart.GetTotalQuantity();
            order.OrderCode = "OD" + DateTime.Now.Ticks;
            order.CreateDate = DateTime.Now;
            //order.Status = "Đang xử lý";

            _context.Orders.Add(order);
            _context.SaveChanges();

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

                var productSize = _context.ProductSizes.FirstOrDefault(ps => ps.ProductId == item.Id && ps.Size == item.Size);
                if (productSize != null)
                {
                    productSize.Quantity -= item.Quantity;
                    if (productSize.Quantity < 0)
                        productSize.Quantity = 0;
                }
            }

            _context.SaveChanges();

            if (order.Payment == 2) // MoMo
            {
                return RedirectToAction("CreateMoMoPayment", new { orderId = order.Id });
            }

            HttpContext.Session.Remove("Cart");
            return RedirectToAction("Success");
        }

        public async Task<IActionResult> CreateMoMoPayment(int orderId)
        {
            var order = await _context.Orders.FindAsync(orderId);
            if (order == null) return NotFound();

            string endpoint = "https://test-payment.momo.vn/v2/gateway/api/create";
            string partnerCode = "MOMO_ATM_DEV";
            string accessKey = "w9gEg8bjA2AM2Cvr";
            string secretKey = "mD9QAVi4cm9N844jh5Y2tqjWaaJoGVFM";
            string orderInfo = $"Thanh toán đơn hàng #{order.OrderCode}";
            string requestId = Guid.NewGuid().ToString();
            string orderIdStr = $"MM{order.Id}_0";
            string amountStr = ((int)(order.TotalAmount ?? 0)).ToString();
            string redirectUrl = Url.Action("MoMoCallback", "ShopCart", null, Request.Scheme);
            string ipnUrl = redirectUrl;

            string rawHash = $"accessKey={accessKey}&amount={amountStr}&extraData=&ipnUrl={ipnUrl}&orderId={orderIdStr}&orderInfo={orderInfo}&partnerCode={partnerCode}&redirectUrl={redirectUrl}&requestId={requestId}&requestType=payWithATM";
            string signature = HmacSha256(secretKey, rawHash);

            var requestBody = new
            {
                partnerCode,
                partnerName = "Adidas Store",
                storeId = "WebBanGiayAdidas",
                requestId,
                amount = amountStr,
                orderId = orderIdStr,
                orderInfo,
                redirectUrl,
                ipnUrl,
                lang = "vi",
                requestType = "payWithATM",
                extraData = "",
                signature
            };

            using var client = new HttpClient();
            var content = new StringContent(JsonConvert.SerializeObject(requestBody), Encoding.UTF8, "application/json");
            var response = await client.PostAsync(endpoint, content);
            var jsonResponse = await response.Content.ReadAsStringAsync();
            dynamic result = JsonConvert.DeserializeObject(jsonResponse);

            if (result != null && result.payUrl != null)
            {
                return Redirect(result.payUrl.ToString());
            }

            return Content($"Lỗi khi tạo thanh toán MoMo. Phản hồi: {jsonResponse}");
        }

        public IActionResult MoMoCallback(string orderId, string resultCode)
        {
            if (string.IsNullOrEmpty(orderId) || !orderId.StartsWith("MM") || !orderId.Contains("_"))
            {
                TempData["Error"] = "Mã đơn hàng không hợp lệ.";
                return RedirectToAction("FormCheckOut");
            }

            var parts = orderId.Substring(2).Split('_');
            if (parts.Length != 2 || !int.TryParse(parts[0], out var parsedOrderId))
            {
                TempData["Error"] = "Định dạng mã đơn hàng sai.";
                return RedirectToAction("FormCheckOut");
            }

            var order = _context.Orders.FirstOrDefault(o => o.Id == parsedOrderId);
            if (order == null)
            {
                TempData["Error"] = "Không tìm thấy đơn hàng.";
                return RedirectToAction("FormCheckOut");
            }

            if (resultCode == "0")
            {
                //order.Status = "Đã thanh toán";
                _context.Orders.Update(order);
                _context.SaveChanges();

                HttpContext.Session.Remove("Cart");
                TempData["Success"] = "Thanh toán MoMo thành công.";
                return RedirectToAction("Success");
            }

            TempData["Error"] = "Thanh toán thất bại.";
            return RedirectToAction("FormCheckOut");
        }

        private string HmacSha256(string key, string data)
        {
            using var hmac = new HMACSHA256(Encoding.UTF8.GetBytes(key));
            var hash = hmac.ComputeHash(Encoding.UTF8.GetBytes(data));
            return BitConverter.ToString(hash).Replace("-", "").ToLower();
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
		public IActionResult MyOrders()
		{
			var userId = HttpContext.Session.GetInt32("UserId");

			if (userId == null)
				return RedirectToAction("Login", "Account");

			//var orders = await _context.Orders
			//	.Where(o => o.UserId == userId)
   //             .OrderByDescending(o => o.OrderCode)
   //             .ToListAsync();

			return View(/*orders*/);
		}

		public async Task<IActionResult> GetOrders(int page = 1, int pageSize = 10)
		{
			var userId = HttpContext.Session.GetInt32("UserId"); // hoặc cách bạn lấy user hiện tại
			var orders = await _context.Orders
				.Where(o => o.UserId == userId)
				.OrderByDescending(o => o.OrderCode)
				.Skip((page - 1) * pageSize)
				.Take(pageSize)
				.ToListAsync();

			return PartialView("_OrderRowPartial", orders);
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
