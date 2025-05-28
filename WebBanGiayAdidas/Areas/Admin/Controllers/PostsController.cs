using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using WebBanGiayAdidas.Models;

namespace WebBanGiayAdidas.Areas.Admin.Controllers
{
	[Authorize(Roles = "Admin")]
	[Area("Admin")]
    public class PostsController : Controller
    {
        private readonly WebBanGiayAdidasContext _context;

        public PostsController(WebBanGiayAdidasContext context)
        {
            _context = context;
        }

        // GET: Admin/Posts
        public async Task<IActionResult> Index(string keyword, int? page)
        {
            var pageSize = 5;
            var pageIndex = page ?? 1;

            var postlist = _context.Posts.AsQueryable();

            if (!string.IsNullOrEmpty(keyword))
            {
                postlist = postlist.Where(n => n.Title.Contains(keyword));
            }

            var totalItems = await postlist.CountAsync();
            var totalPages = (int)Math.Ceiling((double)totalItems / pageSize);

            var items = await postlist
                .OrderByDescending(n => n.CreatedDate)
                .Skip((pageIndex - 1) * pageSize)
                .Take(pageSize)
                .ToListAsync();

            ViewBag.CurrentPage = pageIndex;
            ViewBag.TotalPages = totalPages;
            ViewBag.Keyword = keyword;

            return View(items);
        }


        // GET: Admin/Posts/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
                return NotFound();

            var postitem = await _context.Posts.FirstOrDefaultAsync(m => m.Id == id);

            if (postitem == null)
            {
                return NotFound();
            }

            return PartialView("_PostDetails", postitem);
        }
        //public async Task<IActionResult> Details(int? id)
        //{
        //    if (id == null)
        //    {
        //        return NotFound();
        //    }

        //    var post = await _context.Posts
        //        .Include(p => p.Category)
        //        .FirstOrDefaultAsync(m => m.Id == id);
        //    if (post == null)
        //    {
        //        return NotFound();
        //    }

        //    return View(post);
        //}

        // GET: Admin/Posts/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: Admin/Posts/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Id,Title,Description,Detail,Image,CreatedDate,CreatedBy,ModifierDate,ModifierBy,IsActive,Alias")] Post post, IFormFile imageFile)
        {
            if (ModelState.IsValid)
            {
                if (imageFile != null && imageFile.Length > 0)
                {
                    var filePath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "uploads", "post", imageFile.FileName);
                    using (var stream = new FileStream(filePath, FileMode.Create))
                    {
                        await imageFile.CopyToAsync(stream);
                    }
                    post.Image = "/uploads/post/" + imageFile.FileName;
                }
                post.Alias = WebBanGiayAdidas.Models.Common.Filter.FilterChar(post.Alias);
                post.CreatedDate = DateTime.Now;
                _context.Add(post);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(post);
        }

        // GET: Admin/Posts/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var post = await _context.Posts.FindAsync(id);
            if (post == null)
            {
                return NotFound();
            }
            return View(post);
        }

        // POST: Admin/Posts/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("Id,Title,Description,Detail,Image,CreatedDate,CreatedBy,ModifierDate,ModifierBy,IsActive,Alias")] Post post, IFormFile? imageFile)
        {
            if (id != post.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    if (imageFile != null && imageFile.Length > 0)
                    {
                        var filePath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "uploads", "post", imageFile.FileName);
                        using (var stream = new FileStream(filePath, FileMode.Create))
                        {
                            await imageFile.CopyToAsync(stream);
                        }
                        post.Image = "/uploads/post/" + imageFile.FileName;
                    }
                    else
                    {
                        // Nếu không có ảnh mới, lấy ảnh cũ từ cơ sở dữ liệu và giữ lại
                        var existingPost = await _context.Posts.AsNoTracking().FirstOrDefaultAsync(n => n.Id == post.Id);
                        if (existingPost != null)
                        {
                            post.Image = existingPost.Image;  // Giữ lại ảnh cũ
                        }
                    }
                    post.Alias = WebBanGiayAdidas.Models.Common.Filter.FilterChar(post.Alias);
                    post.ModifierDate = DateTime.Now;
                    _context.Update(post);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!PostExists(post.Id))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            return View(post);
        }

        //// GET: Admin/Posts/Delete/5
        //public async Task<IActionResult> Delete(int? id)
        //{
        //    if (id == null)
        //    {
        //        return NotFound();
        //    }

        //    var post = await _context.Posts
        //        .Include(p => p.Category)
        //        .FirstOrDefaultAsync(m => m.Id == id);
        //    if (post == null)
        //    {
        //        return NotFound();
        //    }

        //    return View(post);
        //}

        //// POST: Admin/Posts/Delete/5
        //[HttpPost, ActionName("Delete")]
        //[ValidateAntiForgeryToken]
        //public async Task<IActionResult> DeleteConfirmed(int id)
        //{
        //    var post = await _context.Posts.FindAsync(id);
        //    if (post != null)
        //    {
        //        _context.Posts.Remove(post);
        //    }

        //    await _context.SaveChangesAsync();
        //    return RedirectToAction(nameof(Index));
        //}

        // POST: Admin/Posts/Delete
        [HttpPost]
        public async Task<IActionResult> Delete(int id)
        {
            var posts = await _context.Posts.FindAsync(id);
            if (posts == null)
            {
                return Json(new { success = false, message = "Tin tức không tồn tại." });
            }

            try
            {
                _context.Posts.Remove(posts);
                await _context.SaveChangesAsync();
                return Json(new { success = true, message = "Xóa thành công." });
            }
            catch (Exception ex)
            {
                return Json(new { success = false, message = "Lỗi khi xóa: " + ex.Message });
            }
        }
        // POST: Admin/Posts/ToggleStatus
        [HttpPost]
        public async Task<IActionResult> ToggleStatus(int id)
        {
            var posts = await _context.Posts.FindAsync(id);
            if (posts == null)
            {
                return Json(new { success = false, message = "Không tìm thấy tin tức." });
            }

            posts.IsActive = !posts.IsActive;
            _context.Update(posts);
            await _context.SaveChangesAsync();

            return Json(new
            {
                success = true,
                isActive = posts.IsActive
            });
        }

        private bool PostExists(int id)
        {
            return _context.Posts.Any(e => e.Id == id);
        }
    }
}
