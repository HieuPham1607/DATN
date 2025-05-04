using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Hosting;
using WebBanGiayAdidas.Models;

namespace WebBanGiayAdidas.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class ProductCategoriesController : Controller
    {
        private readonly WebBanGiayAdidasContext _context;

        public ProductCategoriesController(WebBanGiayAdidasContext context)
        {
            _context = context;
        }

        // GET: Admin/ProductCategories
        //public async Task<IActionResult> Index()
        //{
        //    return View(await _context.ProductCategories.ToListAsync());
        //}
        public async Task<IActionResult> Index(string keyword, int? page)
        {
            var pageSize = 5;
            var pageIndex = page ?? 1;

            var pclist = _context.ProductCategories.AsQueryable();

            if (!string.IsNullOrEmpty(keyword))
            {
                pclist = pclist.Where(n => n.Title.Contains(keyword));
            }

            var totalItems = await pclist.CountAsync();
            var totalPages = (int)Math.Ceiling((double)totalItems / pageSize);

            var items = await pclist
                .OrderByDescending(n => n.CreatedDate)
                .Skip((pageIndex - 1) * pageSize)
                .Take(pageSize)
                .ToListAsync();

            ViewBag.CurrentPage = pageIndex;
            ViewBag.TotalPages = totalPages;
            ViewBag.Keyword = keyword;

            return View(items);
        }

        // GET: Admin/ProductCategories/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var productCategory = await _context.ProductCategories
                .FirstOrDefaultAsync(m => m.Id == id);
            if (productCategory == null)
            {
                return NotFound();
            }

            return View(productCategory);
        }

        // GET: Admin/ProductCategories/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: Admin/ProductCategories/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Id,Title,Description,Icon,CreatedDate,CreatedBy,ModifierDate,ModifierBy,Alias")] ProductCategory productCategory, IFormFile imageFile)
        {
            if (ModelState.IsValid)
            {
                if (imageFile != null && imageFile.Length > 0)
                {
                    var filePath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "uploads", "productcategories", imageFile.FileName);
                    using (var stream = new FileStream(filePath, FileMode.Create))
                    {
                        await imageFile.CopyToAsync(stream);
                    }
                    productCategory.Icon = "/uploads/productcategories/" + imageFile.FileName;
                }
                // Nếu Alias bị bỏ trống thì tạo từ Title
                if (string.IsNullOrEmpty(productCategory.Alias))
                {
                    productCategory.Alias = productCategory.Title;
                }

                // Chuẩn hoá Alias
                productCategory.Alias = WebBanGiayAdidas.Models.Common.Filter.FilterChar(productCategory.Alias);

                _context.Add(productCategory);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(productCategory);
        }

        // GET: Admin/ProductCategories/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var productCategory = await _context.ProductCategories.FindAsync(id);
            if (productCategory == null)
            {
                return NotFound();
            }
            return View(productCategory);
        }

        // POST: Admin/ProductCategories/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("Id,Title,Description,Icon,CreatedDate,CreatedBy,ModifierDate,ModifierBy")] ProductCategory productCategory, IFormFile imageFile)
        {
            if (id != productCategory.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    if (imageFile != null && imageFile.Length > 0)
                    {
                        var filePath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "uploads", "productcategories", imageFile.FileName);
                        using (var stream = new FileStream(filePath, FileMode.Create))
                        {
                            await imageFile.CopyToAsync(stream);
                        }
                        productCategory.Icon = "/uploads/productcategories/" + imageFile.FileName;
                    }
                    _context.Update(productCategory);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!ProductCategoryExists(productCategory.Id))
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
            return View(productCategory);
        }

        //// GET: Admin/ProductCategories/Delete/5
        //public async Task<IActionResult> Delete(int? id)
        //{
        //    if (id == null)
        //    {
        //        return NotFound();
        //    }

        //    var productCategory = await _context.ProductCategories
        //        .FirstOrDefaultAsync(m => m.Id == id);
        //    if (productCategory == null)
        //    {
        //        return NotFound();
        //    }

        //    return View(productCategory);
        //}

        //// POST: Admin/ProductCategories/Delete/5
        //[HttpPost, ActionName("Delete")]
        //[ValidateAntiForgeryToken]
        //public async Task<IActionResult> DeleteConfirmed(int id)
        //{
        //    var productCategory = await _context.ProductCategories.FindAsync(id);
        //    if (productCategory != null)
        //    {
        //        _context.ProductCategories.Remove(productCategory);
        //    }

        //    await _context.SaveChangesAsync();
        //    return RedirectToAction(nameof(Index));
        //}

        // POST: Admin/ProductCategories/Delete
        [HttpPost]
        public async Task<IActionResult> Delete(int id)
        {
            var productCategory = await _context.ProductCategories.FindAsync(id);
            if (productCategory == null)
            {
                return Json(new { success = false, message = "Tin tức không tồn tại." });
            }

            try
            {
                _context.ProductCategories.Remove(productCategory);
                await _context.SaveChangesAsync();
                return Json(new { success = true, message = "Xóa thành công." });
            }
            catch (Exception ex)
            {
                return Json(new { success = false, message = "Lỗi khi xóa: " + ex.Message });
            }
        }

        private bool ProductCategoryExists(int id)
        {
            return _context.ProductCategories.Any(e => e.Id == id);
        }
    }
}
