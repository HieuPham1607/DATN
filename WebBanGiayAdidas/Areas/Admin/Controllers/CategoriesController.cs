using System;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WebBanGiayAdidas.Filters;
using WebBanGiayAdidas.Models;

namespace WebBanGiayAdidas.Areas.Admin.Controllers
{
	[Authorize(Roles = "Admin")]
	[Area("Admin")]
    public class CategoriesController : Controller
    {
        private readonly WebBanGiayAdidasContext _context;

        public CategoriesController(WebBanGiayAdidasContext context)
        {
            _context = context;
        }

        // GET: Admin/Categories
        public async Task<IActionResult> Index()
        {
            return View(await _context.Categories.ToListAsync());
        }

        // GET: Admin/Categories/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var category = await _context.Categories
                .FirstOrDefaultAsync(m => m.Id == id);
            if (category == null)
            {
                return NotFound();
            }

            // Nếu là yêu cầu AJAX, trả về Partial View
            if (Request.Headers["X-Requested-With"] == "XMLHttpRequest")
            {
                return PartialView("_CategoryDetails", category); // Trả về Partial View với chi tiết của danh mục
            }

            return View(category); // Trả về view chi tiết nếu không phải là yêu cầu AJAX
        }

        // GET: Admin/Categories/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: Admin/Categories/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Id,Title,SeoTitle,SeoDescripyion,SeoKeywords,Description,Position,CreatedDate,CreatedBy,ModifierDate,ModifierBy,Alias")] Category category)
        {
            if (ModelState.IsValid)
            {
                //// Nếu Alias bị bỏ trống thì tạo từ Title
                //if (string.IsNullOrEmpty(category.Alias))
                //{
                //    category.Alias = category.Title;
                //}

                // Chuẩn hoá Alias
                category.Alias = WebBanGiayAdidas.Models.Common.Filter.FilterChar(category.Alias);

                // Tự set ngày tạo nếu cần
                category.CreatedDate = DateTime.Now;
                category.IsActive = true;

                _context.Add(category);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(category);
        }

        // GET: Admin/Categories/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var category = await _context.Categories.FindAsync(id);
            if (category == null)
            {
                return NotFound();
            }
            return View(category);
        }

        // POST: Admin/Categories/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("Id,Title,SeoTitle,SeoDescripyion,SeoKeywords,Description,Position,CreatedDate,CreatedBy,ModifierDate,ModifierBy,Alias")] Category category)
        {
            if (id != category.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    category.Alias = WebBanGiayAdidas.Models.Common.Filter.FilterChar(category.Alias);
                    _context.Update(category);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!CategoryExists(category.Id))
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
            return View(category);
        }

        // GET: Admin/Categories/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var category = await _context.Categories
                .FirstOrDefaultAsync(m => m.Id == id);
            if (category == null)
            {
                return NotFound();
            }

            return View(category);
        }

        //// POST: Admin/Categories/Delete/5 (dùng nếu xóa theo kiểu submit form)
        //[HttpPost, ActionName("DeleteConfirmed")]
        //[ValidateAntiForgeryToken]
        //public async Task<IActionResult> DeleteConfirmed(int id)
        //{
        //    var category = await _context.Categories.FindAsync(id);
        //    if (category == null)
        //    {
        //        return NotFound();
        //    }

        //    _context.Categories.Remove(category);
        //    await _context.SaveChangesAsync();
        //    return RedirectToAction(nameof(Index));
        //}

        // API DELETE bằng AJAX
        [HttpPost]
        public async Task<IActionResult> Delete([FromBody] DeleteRequest request)
        {
            if (request == null || request.Id <= 0)
            {
                return Json(new { success = false, message = "ID không hợp lệ." });
            }

            var category = await _context.Categories.FindAsync(request.Id);
            if (category == null)
            {
                return Json(new { success = false, message = "Danh mục không tồn tại." });
            }

            try
            {
                _context.Categories.Remove(category);
                await _context.SaveChangesAsync();
                return Json(new { success = true, message = "Xóa danh mục thành công." });
            }
            catch (Exception ex)
            {
                return Json(new { success = false, message = "Lỗi khi xóa: " + ex.Message });
            }
        }

        private bool CategoryExists(int id)
        {
            return _context.Categories.Any(e => e.Id == id);
        }
    }

    // Model request cho API Delete AJAX
    public class DeleteRequest
    {
        public int Id { get; set; }
    }
}
