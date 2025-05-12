using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using PagedList;
using WebBanGiayAdidas.Filters;
using WebBanGiayAdidas.Models;

namespace WebBanGiayAdidas.Areas.Admin.Controllers
{
	[Authorize(Roles = "Admin")]
	[Area("Admin")]
    public class NewsController : Controller
    {
        private readonly WebBanGiayAdidasContext _context;

        public NewsController(WebBanGiayAdidasContext context)
        {
            _context = context;
        }

        // GET: Admin/News
        public async Task<IActionResult> Index(string keyword, int? page)
        {
            var pageSize = 5;
            var pageIndex = page ?? 1;

            var newsList = _context.News.Include(n => n.Category).AsQueryable();

            if (!string.IsNullOrEmpty(keyword))
            {
                newsList = newsList.Where(n => n.Title.Contains(keyword));
            }

            var totalItems = await newsList.CountAsync();
            var totalPages = (int)Math.Ceiling((double)totalItems / pageSize);

            var items = await newsList
                .OrderByDescending(n => n.CreatedDate)
                .Skip((pageIndex - 1) * pageSize)
                .Take(pageSize)
                .ToListAsync();

            ViewBag.CurrentPage = pageIndex;
            ViewBag.TotalPages = totalPages;
            ViewBag.Keyword = keyword;

            return View(items);
        }

        // GET: Admin/News/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
                return NotFound();

            var newsItem = await _context.News
                .Include(n => n.Category)
                .FirstOrDefaultAsync(m => m.Id == id);

            if (newsItem == null)
            {
                return NotFound();
            }

            return PartialView("_NewDetails", newsItem);
        }

        // GET: Admin/News/Create
        public IActionResult Create()
        {
            ViewData["CategoryId"] = new SelectList(_context.Categories, "Id", "Title");
            return View();
        }

        // POST: Admin/News/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Id,Title,CategoryId,Description,Detail,Image,SeoTitle,SeoDescripyion,SeoKeywords,CreatedDate,CreatedBy,ModifierDate,ModifierBy,IsActive,Alias")] New @new, IFormFile imageFile)
        {
            if (ModelState.IsValid)
            {
                if (imageFile != null && imageFile.Length > 0)
                {
                    var filePath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "uploads", "new", imageFile.FileName);
                    using (var stream = new FileStream(filePath, FileMode.Create))
                    {
                        await imageFile.CopyToAsync(stream);
                    }
                    @new.Image = "/uploads/new/" + imageFile.FileName;
                }
				@new.Alias = WebBanGiayAdidas.Models.Common.Filter.FilterChar(@new.Alias);
				_context.Add(@new);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }

            ViewData["CategoryId"] = new SelectList(_context.Categories, "Id", "Title", @new.CategoryId);
            return View(@new);
        }

        // GET: Admin/News/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
                return NotFound();

            var newsItem = await _context.News.FindAsync(id);
            if (newsItem == null)
                return NotFound();

            ViewBag.ExistingMainImage = newsItem.Image;
            ViewData["CategoryId"] = new SelectList(_context.Categories, "Id", "Title", newsItem.CategoryId);
            return View(newsItem);
        }

        // POST: Admin/News/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("Id,Title,CategoryId,Description,Detail,Image,SeoTitle,SeoDescripyion,SeoKeywords,CreatedDate,CreatedBy,ModifierDate,ModifierBy,IsActive,Alias")] New @new, IFormFile? imageFile)
        {
            if (id != @new.Id)
                return NotFound();

            if (ModelState.IsValid)
            {
                try
                {
                    if (imageFile != null && imageFile.Length > 0)
                    {
                        // Nếu có ảnh mới, lưu ảnh và cập nhật đường dẫn
                        var filePath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "uploads", "new", imageFile.FileName);
                        using (var stream = new FileStream(filePath, FileMode.Create))
                        {
                            await imageFile.CopyToAsync(stream);
                        }
                        @new.Image = "/uploads/new/" + imageFile.FileName;  // Cập nhật ảnh mới
                    }
                    else
                    {
                        // Nếu không có ảnh mới, lấy ảnh cũ từ cơ sở dữ liệu và giữ lại
                        var existingNew = await _context.News.AsNoTracking().FirstOrDefaultAsync(n => n.Id == @new.Id);
                        if (existingNew != null)
                        {
                            @new.Image = existingNew.Image;  // Giữ lại ảnh cũ
                        }
                    }

                    @new.Alias = WebBanGiayAdidas.Models.Common.Filter.FilterChar(@new.Alias);
                    _context.Update(@new);  // Cập nhật đối tượng tin tức
                    await _context.SaveChangesAsync();  // Lưu vào cơ sở dữ liệu
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!NewExists(@new.Id))
                        return NotFound();
                    else
                        throw;
                }

                return RedirectToAction(nameof(Index));  // Điều hướng về danh sách
            }

            ViewData["CategoryId"] = new SelectList(_context.Categories, "Id", "Title", @new.CategoryId);
            return View(@new);  // Trả về lại View với model đã cập nhật
        }



        // POST: Admin/News/Delete
        [HttpPost]
        public async Task<IActionResult> Delete(int id)
        {
            var news = await _context.News.FindAsync(id);
            if (news == null)
            {
                return Json(new { success = false, message = "Tin tức không tồn tại." });
            }

            try
            {
                _context.News.Remove(news);
                await _context.SaveChangesAsync();
                return Json(new { success = true, message = "Xóa thành công." });
            }
            catch (Exception ex)
            {
                return Json(new { success = false, message = "Lỗi khi xóa: " + ex.Message });
            }
        }

        // POST: Admin/News/ToggleStatus
        [HttpPost]
        public async Task<IActionResult> ToggleStatus(int id)
        {
            var news = await _context.News.FindAsync(id);
            if (news == null)
            {
                return Json(new { success = false, message = "Không tìm thấy tin tức." });
            }

            news.IsActive = !news.IsActive;
            _context.Update(news);
            await _context.SaveChangesAsync();

            return Json(new
            {
                success = true,
                isActive = news.IsActive
            });
        }

        private bool NewExists(int id)
        {
            return _context.News.Any(e => e.Id == id);
        }
    }
}
