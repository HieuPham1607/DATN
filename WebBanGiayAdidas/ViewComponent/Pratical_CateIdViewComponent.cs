using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WebBanGiayAdidas.Models;

namespace WebBanGiayAdidas.ViewComponents
{
	public class Pratical_CateIdViewComponent : ViewComponent
	{
		private readonly WebBanGiayAdidasContext _context;

		public Pratical_CateIdViewComponent(WebBanGiayAdidasContext context)
		{
			_context = context;
		}

		public async Task<IViewComponentResult> InvokeAsync()
		{
			var items = await _context.Products
                .Where(x => x.IsHome && x.IsActive)
                .Take(10)
				.ToListAsync();

			return View("_Pratical_CateId", items);
		}
	}
}
