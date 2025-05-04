using Microsoft.AspNetCore.Mvc;
using WebBanGiayAdidas.Models;
using Microsoft.EntityFrameworkCore;

namespace WebBanGiayAdidas.ViewComponents
{
	public class MenuProductCategoryViewComponent : ViewComponent
	{
		private readonly WebBanGiayAdidasContext _context;

		public MenuProductCategoryViewComponent(WebBanGiayAdidasContext context)
		{
			_context = context;
		}

		public async Task<IViewComponentResult> InvokeAsync()
		{
			var items = await _context.ProductCategories.ToListAsync();
			return View("_MenuProductCategory", items);
		}
	}
}
