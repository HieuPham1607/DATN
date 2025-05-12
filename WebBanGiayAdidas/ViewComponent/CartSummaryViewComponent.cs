using Microsoft.AspNetCore.Mvc;
using WebBanGiayAdidas.Models;

namespace WebBanGiayAdidas.ViewComponents
{
    public class CartSummaryViewComponent : ViewComponent
    {
        private readonly WebBanGiayAdidasContext _context;

        public CartSummaryViewComponent(WebBanGiayAdidasContext context)
        {
            _context = context;
        }
        public IViewComponentResult Invoke()
        {
            var cart = HttpContext.Session.GetObjectFromJson<ShopCart>("Cart") ?? new ShopCart();
            return View("_CartSummary", cart);
        }
    }
}
