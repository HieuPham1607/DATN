using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WebBanGiayAdidas.Models;

namespace WebBanGiayAdidas.ViewComponents
{
	public class ProductSaleViewComponent : ViewComponent
	{
		private readonly WebBanGiayAdidasContext _context;

		public ProductSaleViewComponent(WebBanGiayAdidasContext context)
		{
			_context = context;
		}

		public async Task<IViewComponentResult> InvokeAsync()
		{
			var items = await _context.Products.Where(x => x.IsActive && x.IsSale).Take(10).ToListAsync();
			return View("_ProductSale", items);
		}
	}
}
