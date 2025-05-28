using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WebBanGiayAdidas.Models;

namespace WebBanGiayAdidas.Controllers
{
	public class NewController : Controller
	{
        private readonly WebBanGiayAdidasContext _context;

        public NewController(WebBanGiayAdidasContext context)
        {
            _context = context;
        }
        public IActionResult Index(int? id, int page = 1, int pageSize = 5)
        {
            //sắp xếp thứ tự theo ngày
            var allNews = _context.News.OrderByDescending(n => n.CreatedDate).Where(x => x.IsActive).ToList();

            New mainNews;
            if (id.HasValue)
            {
                mainNews = allNews.FirstOrDefault(n => n.Id == id.Value);
                //if (mainNews != null)
                //{
                //    //Xóa khi MainNews có New đấy rồi
                //    allNews.Remove(mainNews);
                //}
                //else
                //{
                //    mainNews = allNews.FirstOrDefault();
                //    allNews = allNews.Where(n => n.Id != mainNews.Id).ToList();
                //}
            }
            else
            {
                mainNews = allNews.FirstOrDefault();
                //allNews = allNews.Where(n => n.Id != mainNews.Id).ToList();
            }

            var otherItems = allNews.Skip((page - 1) * pageSize).Where(x => x.IsActive).Take(pageSize).ToList();

            ViewBag.MainNews = mainNews;
            ViewBag.TotalPages = (int)Math.Ceiling((double)allNews.Count / pageSize);
            ViewBag.CurrentPage = page;

            return View(otherItems); // Model = danh sách tin còn lại
        }
        public IActionResult LoadMainNews(int id)
        {
            var mainNews = _context.News.FirstOrDefault(n => n.Id == id && n.IsActive);
            if (mainNews == null)
            {
                return NotFound(); // Trả về lỗi 404 nếu bài viết không tồn tại
            }

            // Trả về phần nội dung bài viết chính
            return PartialView("_MainNews", mainNews);
        }

        public async Task<IActionResult> Detail(string alias, int id)
		{
			var @new = await _context.News
				.FirstOrDefaultAsync(p => p.Id == id && p.Alias == alias);

			if (@new == null)
				return NotFound();

			return View(@new);
		}
    }
}
