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
		public async Task<IActionResult> Index(int? id)
		{
			var items = await _context.Products.ToListAsync();
			if (id != null) 
			{
				items = items.Where(x => x.IsActive && x.Id == id).ToList();
			}
            var cate = _context.ProductCategories.Find(id);
            if (cate != null)
            {
                ViewBag.CateName = cate.Title;
            }
            return View(items);
		}
		public async Task<IActionResult> Detail(string alias, int id)
		{
			var product = await _context.Products
				.Include(p => p.ChildImages)
				.FirstOrDefaultAsync(p => p.Id == id && p.Alias == alias);

			if (product == null)
				return NotFound();

			return View(product);
		}

		public async Task<IActionResult> ProductCategory(string alias,int id)
		{
			var items = await _context.Products.ToListAsync();
			if (id > 0)
			{
				items = items.Where(x => x.IsActive && x.ProductCategoryId == id).ToList();
			}
			var cate = _context.ProductCategories.Find(id);
			if (cate != null) 
			{
				ViewBag.CateName = cate.Title;
			}
			ViewBag.CateId = id;
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
	}
}
