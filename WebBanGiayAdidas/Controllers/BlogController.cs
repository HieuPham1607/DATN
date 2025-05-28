using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WebBanGiayAdidas.Models;

namespace WebBanGiayAdidas.Controllers
{
    public class BlogController : Controller
    {
        private readonly WebBanGiayAdidasContext _context;

        public BlogController(WebBanGiayAdidasContext context)
        {
            _context = context;
        }

        // Action Index với phân trang
        public IActionResult Index(int page = 1)
        {
            int pageSize = 5;

            var allPosts = _context.Posts
                .OrderByDescending(p => p.CreatedDate); // Sắp xếp bài viết mới nhất lên trước

            var pagedPosts = allPosts
                .Skip((page - 1) * pageSize)
                .Take(pageSize)
                .ToList();

            ViewBag.CurrentPage = page;
            ViewBag.TotalPages = (int)Math.Ceiling((double)allPosts.Count() / pageSize);

            return View(pagedPosts);
        }

        // Chi tiết bài viết
        public async Task<IActionResult> Detail(string alias, int id)
        {
            var blog = await _context.Posts
                .FirstOrDefaultAsync(p => p.Id == id && p.Alias == alias);

            if (blog == null)
                return NotFound();

            return View(blog);
        }
    }
}
