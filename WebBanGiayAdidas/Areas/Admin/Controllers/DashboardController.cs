using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WebBanGiayAdidas.Models;

namespace WebBanGiayAdidas.Areas.Admin.Controllers
{
    [Authorize(Roles = "Admin")]
    [Area("Admin")]
    public class DashboardController : Controller
    {
        private readonly WebBanGiayAdidasContext _context;

        public DashboardController(WebBanGiayAdidasContext context)
        {
            _context = context;
        }

        public async Task<IActionResult> Index()
        {
            ViewBag.TotalProducts = await _context.Products.CountAsync();
            ViewBag.NewOrders = await _context.Orders.CountAsync();
            ViewBag.TotalUsers = await _context.Users.CountAsync();
            var totalAdmins = await _context.UserRoles
    .Where(ur => ur.Role != null && ur.Role.RoleName == "Admin")
    .Select(ur => ur.UserId)
    .Distinct()
    .CountAsync();

            ViewBag.TotalAdmins = totalAdmins;

            return View();
        }
    }
}
