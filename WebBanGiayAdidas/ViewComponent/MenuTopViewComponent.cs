using Microsoft.AspNetCore.Mvc;
using WebBanGiayAdidas.Models;
using Microsoft.EntityFrameworkCore;
using System.Linq;
using System.Threading.Tasks;

public class MenuTopViewComponent : ViewComponent
{
    private readonly WebBanGiayAdidasContext _context;

    public MenuTopViewComponent(WebBanGiayAdidasContext context)
    {
        _context = context;
    }

    public async Task<IViewComponentResult> InvokeAsync()
    {
        var items = await _context.Categories
            .Where(c => c.IsActive) 
            .OrderBy(c => c.Position)
            .ToListAsync();

        return View("_MenuTop", items);
    }
}
