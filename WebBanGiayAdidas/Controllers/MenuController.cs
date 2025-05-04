using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WebBanGiayAdidas.Models;

public class MenuController : Controller
{
	private readonly WebBanGiayAdidasContext _context;

	public MenuController(WebBanGiayAdidasContext context)
	{
		_context = context;
	}

	public async Task<IActionResult> MenuTop()
	{
		var items = await _context.Categories.OrderBy(x => x.Position).ToListAsync();
		return PartialView("_MenuTop", items);
	}
	public async Task<IActionResult> MenuProductCategory()
	{
		var items = await _context.ProductCategories.ToListAsync();
		return PartialView("_MenuProductCategory", items);
	}
	public async Task<IActionResult> MenuCategoryLeft()
	{
		var items = await _context.ProductCategories.ToListAsync();
		return PartialView("_MenuCategoryLeft", items);
	}
	public async Task<IActionResult> MenuArrivals()
	{
		var items = await _context.ProductCategories.ToListAsync();
		return PartialView("_MenuArrivals", items);
	}
}
