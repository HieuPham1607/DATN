using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using WebBanGiayAdidas.Models;

namespace WebBanGiayAdidas.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class ProductsController : Controller
    {
        private readonly WebBanGiayAdidasContext _context;

        public ProductsController(WebBanGiayAdidasContext context)
        {
            _context = context;
        }

        // GET: Admin/Products
        public async Task<IActionResult> Index(string keyword, int? page)
        {
            var pageSize = 5;
            var pageIndex = page ?? 1;

            var postlist = _context.Products.Include(p => p.ProductCategory).AsQueryable();

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

        // GET: Admin/Products/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var product = await _context.Products
                .Include(p => p.ProductCategory)
                .Include(p => p.ChildImages)
                .FirstOrDefaultAsync(m => m.Id == id);

            if (product == null)
            {
                return NotFound();
            }

            return View(product);
        }

        // GET: Admin/Products/Create
        public IActionResult Create()
        {
            ViewData["ProductCategoryId"] = new SelectList(_context.ProductCategories, "Id", "Title");
            return View();
        }

        // POST: Admin/Products/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(
            [Bind("Id,Title,ProductCategoryId,ProductCode,Description,Detail,Image,Price,PriceSale,Quantity,SeoTitle,SeoDescripyion,SeoKeywords,CreatedDate,CreatedBy,ModifierDate,ModifierBy,IsActive,IsHome,IsHot,IsFeature,IsSale")] Product product,
            IFormFile imageFile,
            List<IFormFile> imageChildren)
        {
            if (ModelState.IsValid)
            {
                // Upload ảnh đại diện
                if (imageFile != null && imageFile.Length > 0)
                {
                    var avatarFolder = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "uploads", "product");
                    if (!Directory.Exists(avatarFolder))
                        Directory.CreateDirectory(avatarFolder);

                    var fileName = Path.GetFileName(imageFile.FileName);
                    var filePath = Path.Combine(avatarFolder, fileName);

                    using (var stream = new FileStream(filePath, FileMode.Create))
                    {
                        await imageFile.CopyToAsync(stream);
                    }

                    product.Image = "/uploads/product/" + fileName;
                }

                _context.Add(product);
                await _context.SaveChangesAsync(); // Lưu để có product.Id

                // Upload ảnh con (ChildImages)
                if (imageChildren != null && imageChildren.Count > 0)
                {
                    var childFolder = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "uploads", "product-images");
                    if (!Directory.Exists(childFolder))
                        Directory.CreateDirectory(childFolder);

                    foreach (var image in imageChildren)
                    {
                        if (image != null && image.Length > 0)
                        {
                            var childFileName = Path.GetFileName(image.FileName);
                            var childPath = Path.Combine(childFolder, childFileName);

                            using (var stream = new FileStream(childPath, FileMode.Create))
                            {
                                await image.CopyToAsync(stream);
                            }

                            var childImage = new ChildImage
                            {
                                ProductId = product.Id,
                                ImagePath = "/uploads/product-images/" + childFileName
                            };

                            _context.ChildImages.Add(childImage);
                        }
                    }

                    await _context.SaveChangesAsync();
                }

                return RedirectToAction(nameof(Index));
            }

            ViewData["ProductCategoryId"] = new SelectList(_context.ProductCategories, "Id", "Title", product.ProductCategoryId);
            return View(product);
        }

        // GET: Admin/Products/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var product = await _context.Products
                .Include(p => p.ChildImages) // Bao gồm ảnh con
                .FirstOrDefaultAsync(m => m.Id == id);

            if (product == null)
            {
                return NotFound();
            }

            // Truyền ảnh đại diện và ảnh con vào View
            ViewBag.ExistingMainImage = product.Image;
            ViewBag.ExistingChildImages = product.ChildImages;

            ViewData["ProductCategoryId"] = new SelectList(_context.ProductCategories, "Id", "Title", product.ProductCategoryId);
            return View(product);
        }

        // POST: Admin/Products/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("Id,Title,ProductCategoryId,ProductCode,Description,Detail,Image,Price,PriceSale,Quantity,SeoTitle,SeoDescripyion,SeoKeywords,CreatedDate,CreatedBy,ModifierDate,ModifierBy,IsActive,IsHome,IsHot,IsFeature,IsSale")] Product product, IFormFile imageFile, List<IFormFile> imageChildren)
        {
            if (id != product.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    if (imageFile != null && imageFile.Length > 0)
                    {
                        var filePath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "uploads", "product", imageFile.FileName);
                        using (var stream = new FileStream(filePath, FileMode.Create))
                        {
                            await imageFile.CopyToAsync(stream);
                        }
                        product.Image = "/uploads/product/" + imageFile.FileName;
                    }
                    else
                    {
                        _context.Entry(product).Property(p => p.Image).IsModified = true;
                    }

                    _context.Update(product);

                    // Xử lý ảnh con (child images)
                    if (imageChildren != null && imageChildren.Count > 0)
                    {
                        var childFolder = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "uploads", "product-images");
                        if (!Directory.Exists(childFolder))
                            Directory.CreateDirectory(childFolder);

                        // Xóa ảnh con cũ (nếu có)
                        var existingChildImages = _context.ChildImages.Where(c => c.ProductId == product.Id).ToList();
                        _context.ChildImages.RemoveRange(existingChildImages);

                        // Thêm ảnh con mới
                        foreach (var image in imageChildren)
                        {
                            if (image != null && image.Length > 0)
                            {
                                var childFileName = Path.GetFileName(image.FileName);
                                var childPath = Path.Combine(childFolder, childFileName);

                                using (var stream = new FileStream(childPath, FileMode.Create))
                                {
                                    await image.CopyToAsync(stream);
                                }

                                var childImage = new ChildImage
                                {
                                    ProductId = product.Id,
                                    ImagePath = "/uploads/product-images/" + childFileName
                                };

                                _context.ChildImages.Add(childImage);
                            }
                        }
                    }

                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!ProductExists(product.Id))
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

            ViewData["ProductCategoryId"] = new SelectList(_context.ProductCategories, "Id", "Title", product.ProductCategoryId);
            return View(product);
        }
        // POST: Admin/Products/Delete/5
        [HttpPost]
        public async Task<IActionResult> Delete(int id)
        {
            var product = await _context.Products
                .Include(p => p.ChildImages) // Bao gồm ảnh con
                .FirstOrDefaultAsync(p => p.Id == id);

            if (product == null)
            {
                return Json(new { success = false, message = "Sản phẩm không tồn tại." });
            }

            try
            {
                // Xoá từng ảnh con nếu có
                if (product.ChildImages != null && product.ChildImages.Any())
                {
                    _context.ChildImages.RemoveRange(product.ChildImages);
                }

                // Xoá sản phẩm
                _context.Products.Remove(product);
                await _context.SaveChangesAsync();

                return Json(new { success = true, message = "Xóa thành công." });
            }
            catch (Exception ex)
            {
                return Json(new { success = false, message = "Lỗi khi xóa: " + ex.Message });
            }
        }

        // POST: Admin/Products/ToggleStatus
        [HttpPost]
        public async Task<IActionResult> ToggleStatus(int id)
        {
            var product = await _context.Products.FindAsync(id);
            if (product == null)
            {
                return Json(new { success = false, message = "Không tìm thấy sản phẩm." });
            }

            product.IsActive = !product.IsActive;
            _context.Update(product);
            await _context.SaveChangesAsync();

            return Json(new
            {
                success = true,
                isActive = product.IsActive
            });
        }

        private bool ProductExists(int id)
        {
            return _context.Products.Any(e => e.Id == id);
        }
    }
}