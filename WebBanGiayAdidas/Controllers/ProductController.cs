using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WebBanGiayAdidas.Models;

namespace WebBanGiayAdidas.Controllers
{
	public class ProductController : Controller
	{
		private readonly WebBanGiayAdidasContext _context;

		public ProductController(WebBanGiayAdidasContext context)
		{
			_context = context;
		}
        public async Task<IActionResult> Index(int page = 1, int? id = null)
        {
            int pageSize = 8; 

            IQueryable<Product> query = _context.Products.Where(p => p.IsActive)/*.Include(p => p.ProductCategory)*/.AsQueryable();

            if (id != null)
            {
                query = query.Where(p => p.ProductCategoryId == id);
                ViewBag.CateId = id;
            }

            int totalItems = await query.CountAsync();

            var products = await query
                .OrderByDescending(p => p.Id)
                .Skip((page - 1) * pageSize)
                .Take(pageSize)
                .ToListAsync();

            int totalPages = (int)Math.Ceiling((double)totalItems / pageSize);

            ViewBag.CurrentPage = page;
            ViewBag.TotalPages = totalPages;
            ViewBag.IsSearch = false; // Đây không phải trang Search
            ViewBag.Keyword = null;
            ViewBag.CateId = id;

            return View(products);
        }
        [HttpGet]
        public async Task<IActionResult> Search(string keyword, int page = 1)
        {
            int pageSize = 8;

            if (string.IsNullOrEmpty(keyword))
            {
                // Nếu không có từ khóa, chuyển về trang Index
                return RedirectToAction("Index");
            }

            IQueryable<Product> query = _context.Products/*.Include(p => p.ProductCategory)*/
                .Where(p => p.Title.Contains(keyword));

            int totalItems = await query.CountAsync();

            var products = await query
                .OrderByDescending(p => p.Id)
                .Skip((page - 1) * pageSize)
                .Take(pageSize)
                .ToListAsync();

            int totalPages = (int)Math.Ceiling((double)totalItems / pageSize);

            ViewBag.CurrentPage = page;
            ViewBag.TotalPages = totalPages;
            ViewBag.Keyword = keyword;
            ViewBag.IsSearch = true; // Đây là trang Search
            ViewBag.CateId = null;

            return View("Index", products);
        }
        [HttpGet]
        public async Task<IActionResult> SearchSuggestions(string term)
        {
            if (string.IsNullOrEmpty(term))
            {
                return Json(new List<object>());
            }

            var results = await _context.Products
                .Where(p => p.IsActive && p.Title.Contains(term))
                .Select(p => new
                {
                    p.Id,
                    p.Title,
                    p.Alias,
                    ImageUrl = p.Image
                })
                .Take(5)
                .ToListAsync();

            return Json(results);
        }


        public async Task<IActionResult> Detail(string alias, int id)
        {
            var product = await _context.Products
                .Include(p => p.ChildImages)
                .Include(p => p.ProductSizes)
                .Include(p => p.Reviews)
                    .ThenInclude(r => r.User)
                .FirstOrDefaultAsync(p => p.Id == id && p.Alias == alias && p.IsActive);

            if (product == null)
                return NotFound();

            return View(product);
        }
        [HttpPost]
		public async Task<IActionResult> AddReview(int ProductId, string Comment)
		{
			var userId = HttpContext.Session.GetInt32("UserId");
			if (userId == null)
			{
				return Json(new
				{
					success = false,
					redirectTo = Url.Action("Login", "Account"),
					message = "Bạn cần đăng nhập để gửi đánh giá."
				});
			}

			var user = await _context.Users.FindAsync(userId.Value);
			if (user == null)
			{
				return Json(new { success = false, message = "Người dùng không tồn tại." });
			}

			// Kiểm tra review gần nhất của user với sản phẩm này
			var recentReview = await _context.Reviews
				.Where(r => r.UserId == userId.Value && r.ProductId == ProductId)
				.OrderByDescending(r => r.CreatedAt)
				.FirstOrDefaultAsync();

			if (recentReview != null && (DateTime.UtcNow - recentReview.CreatedAt.Value.ToUniversalTime()).TotalSeconds < 20)
			{
				return Json(new { success = false, message = "Vui lòng chờ 20 giây trước khi gửi đánh giá tiếp theo." });
			}

			var review = new Review
			{
				ProductId = ProductId,
				UserId = userId.Value,
				Comment = Comment,
				CreatedAt = DateTime.Now
			};

			_context.Reviews.Add(review);
			await _context.SaveChangesAsync();

			return Json(new
			{
				success = true,
				message = "Gửi đánh giá thành công",
				review = new
				{
					createdAt = review.CreatedAt?.ToString("dd MMM yyyy"),
					userName = user.UserName,
					comment = review.Comment
				}
			});
		}
        public async Task<IActionResult> LoadReviews(int productId, int page = 1, int pageSize = 5)
        {
            var reviews = await _context.Reviews
                .Where(r => r.ProductId == productId)
                .Include(r => r.User)
                .OrderByDescending(r => r.CreatedAt)
                .Skip((page - 1) * pageSize)
                .Take(pageSize)
                .ToListAsync();

            return PartialView("_ReviewsPartial", reviews);
        }

        public async Task<IActionResult> ProductCategory(int? id, int page = 1, int pageSize = 8)
		{
			if (id == null)
			{
				return NotFound();
			}

			// Lấy danh mục để hiển thị tên
			var cate = await _context.ProductCategories.FindAsync(id);
			if (cate == null)
			{
				return NotFound();
			}
			ViewBag.CateName = cate.Title;

			// Lấy sản phẩm theo category và chỉ lấy sản phẩm active
			var query = _context.Products
				.Where(x => x.IsActive && x.ProductCategoryId == id);

			// Tổng số sản phẩm theo category
			int totalItems = await query.CountAsync();

			// Lấy sản phẩm phân trang
			var items = await query
				.OrderByDescending(x => x.Id)
				.Skip((page - 1) * pageSize)
				.Take(pageSize)
				.ToListAsync();

			// Đưa thông tin phân trang xuống View qua ViewBag
			ViewBag.CurrentPage = page;
			ViewBag.PageSize = pageSize;
			ViewBag.TotalItems = totalItems;
			ViewBag.TotalPages = (int)Math.Ceiling((double)totalItems / pageSize);
			ViewBag.CateId = id;
			ViewBag.CategoryId = id; // để truyền tham số khi phân trang

			return View(items);
		}
		public async Task<IActionResult> Pratical_CateId()
		{
			var items = await _context.Products.Where(x => x.IsHome).Take(12).ToListAsync();
			return PartialView(items);
		}
        public async Task<IActionResult> ProductBestSeller()
        {
            var items = await _context.Products.ToListAsync();
            return PartialView("_ProductBestSeller", items);
        }
		public async Task<IActionResult> ProductSale()
		{
			var items = await _context.Products.ToListAsync();
			return PartialView("_ProductSale", items);
		}
        public async Task<IActionResult> ProductFeature()
        {
            var items = await _context.Products.ToListAsync();
            return PartialView("_ProductFeature", items);
        }
    }
}
