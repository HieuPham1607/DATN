using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WebBanGiayAdidas.Models;

namespace WebBanGiayAdidas.ViewComponents
{
	public class MenuCategoryLeftViewComponent : ViewComponent
	{
		private readonly WebBanGiayAdidasContext _context;

		public MenuCategoryLeftViewComponent(WebBanGiayAdidasContext context)
		{
			_context = context;
		}

		public async Task<IViewComponentResult> InvokeAsync(int? id)
		{
			if (id == null) 
			{
				ViewBag.CateId = id;
			}
			var items = await _context.ProductCategories.ToListAsync();
			return View("_MenuCategoryLeft", items);
		}
	}
}
