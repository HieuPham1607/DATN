using Microsoft.AspNetCore.Mvc;
using WebBanGiayAdidas.Models;
using Microsoft.EntityFrameworkCore;

public class MenuTopViewComponent : ViewComponent
{
	private readonly WebBanGiayAdidasContext _context;

	public MenuTopViewComponent(WebBanGiayAdidasContext context)
	{
		_context = context;
	}

	public async Task<IViewComponentResult> InvokeAsync()
	{
		var items = await _context.Categories.OrderBy(x => x.Position).ToListAsync();
		return View("_MenuTop",items);
	}
}
