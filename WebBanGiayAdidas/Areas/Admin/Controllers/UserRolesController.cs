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
    public class UserRolesController : Controller
    {
        private readonly WebBanGiayAdidasContext _context;

        public UserRolesController(WebBanGiayAdidasContext context)
        {
            _context = context;
        }

        // GET: Admin/UserRoles
        public async Task<IActionResult> Index()
        {
            var webBanGiayAdidasContext = _context.UserRoles.Include(u => u.Role).Include(u => u.User);
            return View(await webBanGiayAdidasContext.ToListAsync());
        }

        // GET: Admin/UserRoles/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var userRole = await _context.UserRoles
                .Include(u => u.Role)
                .Include(u => u.User)
                .FirstOrDefaultAsync(m => m.Id == id);
            if (userRole == null)
            {
                return NotFound();
            }

            return View(userRole);
        }

        // GET: Admin/UserRoles/Create
        public IActionResult Create()
        {
            ViewData["RoleId"] = new SelectList(_context.Roles, "Id", "Id");
            ViewData["UserId"] = new SelectList(_context.Users, "Id", "Id");
            return View();
        }

        // POST: Admin/UserRoles/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Id,UserId,RoleId")] UserRole userRole)
        {
            if (ModelState.IsValid)
            {
                _context.Add(userRole);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["RoleId"] = new SelectList(_context.Roles, "Id", "Id", userRole.RoleId);
            ViewData["UserId"] = new SelectList(_context.Users, "Id", "Id", userRole.UserId);
            return View(userRole);
        }

        // GET: Admin/UserRoles/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var userRole = await _context.UserRoles.FindAsync(id);
            if (userRole == null)
            {
                return NotFound();
            }
            ViewData["RoleId"] = new SelectList(_context.Roles, "Id", "Id", userRole.RoleId);
            ViewData["UserId"] = new SelectList(_context.Users, "Id", "Id", userRole.UserId);
            return View(userRole);
        }

        // POST: Admin/UserRoles/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("Id,UserId,RoleId")] UserRole userRole)
        {
            if (id != userRole.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(userRole);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!UserRoleExists(userRole.Id))
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
            ViewData["RoleId"] = new SelectList(_context.Roles, "Id", "Id", userRole.RoleId);
            ViewData["UserId"] = new SelectList(_context.Users, "Id", "Id", userRole.UserId);
            return View(userRole);
        }

        // GET: Admin/UserRoles/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var userRole = await _context.UserRoles
                .Include(u => u.Role)
                .Include(u => u.User)
                .FirstOrDefaultAsync(m => m.Id == id);
            if (userRole == null)
            {
                return NotFound();
            }

            return View(userRole);
        }

        // POST: Admin/UserRoles/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var userRole = await _context.UserRoles.FindAsync(id);
            if (userRole != null)
            {
                _context.UserRoles.Remove(userRole);
            }

            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }
        [HttpPost]
        public IActionResult ToggleRole(int userId, string currentRole)
        {
            try
            {
                var userRole = _context.UserRoles.FirstOrDefault(ur => ur.UserId == userId);
                if (userRole == null)
                {
                    return Json(new { success = false, message = "Không tìm thấy người dùng." });
                }

                string newRoleName = currentRole == "Admin" ? "User" : "Admin";

                var newRole = _context.Roles.FirstOrDefault(r => r.RoleName == newRoleName);
                if (newRole == null)
                {
                    return Json(new { success = false, message = "Không tìm thấy quyền mới." });
                }

                userRole.RoleId = newRole.Id;
                _context.SaveChanges();

                return Json(new { success = true, newRole = newRoleName });
            }
            catch (Exception ex)
            {
                return Json(new { success = false, message = ex.Message });
            }
        }


        private bool UserRoleExists(int id)
        {
            return _context.UserRoles.Any(e => e.Id == id);
        }
    }
}
