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
using Microsoft.Extensions.Hosting;
using WebBanGiayAdidas.Models;

namespace WebBanGiayAdidas.Areas.Admin.Controllers
{
	[Authorize(Roles = "Admin")]
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

            var postlist = _context.Products.Include(p => p.ProductCategory).Include(p => p.ShoeColor).AsQueryable();

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
                return NotFound();

            var product = await _context.Products
                .Include(p => p.ProductCategory)
                .Include(p => p.ShoeColor)
                .Include(p => p.ChildImages)
                .Include(p => p.ProductSizes)
                .FirstOrDefaultAsync(m => m.Id == id);

            if (product == null)
            {
                return NotFound();
            }

            return PartialView("_ProductDetails", product);
        }

        // GET: Admin/Products/Create
        public IActionResult Create()
        {
            ViewData["ProductCategoryId"] = new SelectList(_context.ProductCategories, "Id", "Title");
            ViewData["ShoeColorId"] = new SelectList(_context.ShoeColors, "Id", "ColorName");
            return View();
        }

        // POST: Admin/Products/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(
            [Bind("Id,Title,ProductCategoryId,ShoeColorId,ProductCode,Description,Detail,Image,Price,PriceSale,CreatedDate,CreatedBy,ModifierDate,ModifierBy,IsActive,IsHome,IsHot,IsFeature,IsSale,Alias,ProductGroupId")] Product product,
            IFormFile imageFile,
            List<IFormFile> imageChildren,
            List<ProductSize> Sizes)
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

				// Chuẩn hoá Alias
				product.Alias = WebBanGiayAdidas.Models.Common.Filter.FilterChar(product.Alias);
				product.CreatedDate = DateTime.Now;
				_context.Add(product);
                await _context.SaveChangesAsync(); // Lưu để có product.Id

                if (Sizes != null && Sizes.Any())
                {
                    foreach (var size in Sizes)
                    {
                        size.ProductId = product.Id;  // Gán khóa ngoại
                        _context.ProductSizes.Add(size);
                    }
                    await _context.SaveChangesAsync();
                }
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
            ViewData["ShoeColorId"] = new SelectList(_context.ShoeColors, "Id", "ColorName", product.ShoeColorId);
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
			var sizes = _context.ProductSizes.Where(s => s.ProductId == id).ToList();
			ViewBag.Sizes = sizes;

			// Truyền ảnh đại diện và ảnh con vào View
			ViewBag.ExistingMainImage = product.Image;
            ViewBag.ExistingChildImages = product.ChildImages;

            ViewData["ProductCategoryId"] = new SelectList(_context.ProductCategories, "Id", "Title", product.ProductCategoryId);
            ViewData["ShoeColorId"] = new SelectList(_context.ShoeColors, "Id", "ColorName", product.ShoeColorId);
            return View(product);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(
    int id,
    [Bind("Id,Title,ProductCategoryId,ShoeColorId,ProductCode,Description,Detail,Image,Price,PriceSale,CreatedDate,CreatedBy,ModifierDate,ModifierBy,IsActive,IsHome,IsHot,IsFeature,IsSale,Alias,ProductGroupId")] Product product,
    IFormFile? imageFile,
    List<IFormFile> imageChildren,
    List<IFormFile> ReplacedChildImages,
    List<int> ReplacedImageIds,
	List<ProductSize> Sizes,
	List<int> DeletedChildImageIds)
        {
            if (id != product.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    // Xử lý ảnh đại diện
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
						var existingProducts = await _context.Products.AsNoTracking().FirstOrDefaultAsync(n => n.Id == product.Id);
						if (existingProducts != null)
						{
							product.Image = existingProducts.Image;
						}
					}


					// Chuẩn hoá Alias
					product.Alias = WebBanGiayAdidas.Models.Common.Filter.FilterChar(product.Alias);
					product.ModifierDate = DateTime.Now;
					// Cập nhật thông tin sản phẩm
					_context.Update(product);

                    var childFolder = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "uploads", "product-images");
                    if (!Directory.Exists(childFolder))
                        Directory.CreateDirectory(childFolder);

                    // 1. Xử lý ảnh con mới
                    if (imageChildren != null && imageChildren.Count > 0)
                    {
                        foreach (var image in imageChildren)
                        {
                            if (image != null && image.Length > 0)
                            {
                                var childFileName = $"{Guid.NewGuid()}_{Path.GetFileName(image.FileName)}";
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

                    // 2. Xử lý thay thế ảnh con cũ
                    if (ReplacedChildImages != null && ReplacedChildImages.Count > 0 && ReplacedImageIds != null)
                    {
                        for (int i = 0; i < ReplacedChildImages.Count; i++)
                        {
                            var file = ReplacedChildImages[i];
                            if (i >= ReplacedImageIds.Count) break; // tránh lỗi vượt chỉ số
                            var imageId = ReplacedImageIds[i];

                            var existingImage = await _context.ChildImages.FirstOrDefaultAsync(ci => ci.Id == imageId);
                            if (existingImage != null && file != null && file.Length > 0)
                            {
                                // Xóa file ảnh cũ nếu có
                                var oldPath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", existingImage.ImagePath.TrimStart('/'));
                                if (System.IO.File.Exists(oldPath))
                                {
                                    System.IO.File.Delete(oldPath);
                                }

                                // Lưu ảnh mới
                                var newFileName = $"{Guid.NewGuid()}_{Path.GetFileName(file.FileName)}";
                                var newPath = Path.Combine(childFolder, newFileName);

                                using (var stream = new FileStream(newPath, FileMode.Create))
                                {
                                    await file.CopyToAsync(stream);
                                }

                                // Cập nhật đường dẫn ảnh mới
                                existingImage.ImagePath = "/uploads/product-images/" + newFileName;
                                _context.ChildImages.Update(existingImage);
                            }
                        }
                    }

                    // 3. Xử lý xóa ảnh con
                    if (DeletedChildImageIds != null && DeletedChildImageIds.Count > 0)
                    {
                        var imagesToDelete = _context.ChildImages.Where(ci => DeletedChildImageIds.Contains(ci.Id)).ToList();
                        foreach (var img in imagesToDelete)
                        {
                            var fullPath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", img.ImagePath.TrimStart('/'));
                            if (System.IO.File.Exists(fullPath))
                            {
                                System.IO.File.Delete(fullPath);
                            }
                            _context.ChildImages.Remove(img);
                        }
                    }

                    // Lưu thay đổi
                    await _context.SaveChangesAsync();
					// Xóa các size cũ của sản phẩm
					var oldSizes = _context.ProductSizes.Where(s => s.ProductId == product.Id);
					_context.ProductSizes.RemoveRange(oldSizes);
					await _context.SaveChangesAsync();

					// Thêm size mới
					if (Sizes != null && Sizes.Any())
					{
						foreach (var size in Sizes)
						{
							size.ProductId = product.Id;
							_context.ProductSizes.Add(size);
						}
						await _context.SaveChangesAsync();
					}
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
            ViewData["ShoeColorId"] = new SelectList(_context.ShoeColors, "Id", "ColorName", product.ShoeColorId);
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