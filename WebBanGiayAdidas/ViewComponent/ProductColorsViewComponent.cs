using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WebBanGiayAdidas;
using WebBanGiayAdidas.Models;

namespace WebBanGiayAdidas.ViewComponents
{
    public class ProductColorsViewComponent : ViewComponent
    {
        private readonly WebBanGiayAdidasContext _context;

        public ProductColorsViewComponent(WebBanGiayAdidasContext context)
        {
            _context = context;
        }

        public IViewComponentResult Invoke(Product product)
        {
            var related = _context.Products
                .Include(p => p.ShoeColor)
                .Where(p => p.ProductGroupId == product.ProductGroupId && p.IsActive)
                .ToList();

            return View(related);
        }
    }
}
