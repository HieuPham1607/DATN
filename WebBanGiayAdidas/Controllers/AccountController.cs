using Microsoft.AspNetCore.Mvc;
using WebBanGiayAdidas.Models;
using System.Security.Cryptography;
using System.Text;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using System.Security.Claims;

namespace WebBanGiayAdidas.Controllers
{
    public class AccountController : Controller
    {
        private readonly WebBanGiayAdidasContext _context;

        public AccountController(WebBanGiayAdidasContext context)
        {
            _context = context;
        }

        // GET: /Account/Register
        public IActionResult Register()
        {
            return View();
        }

        // POST: /Account/Register
        [HttpPost]
        public async Task<IActionResult> Register(string username, string email, string password)
        {
            if (await _context.Users.AnyAsync(u => u.UserName == username))
            {
                ModelState.AddModelError("", "Tên đăng nhập đã tồn tại.");
                return View();
            }
            if (await _context.Users.AnyAsync(e => e.Email == email))
            {
                ModelState.AddModelError("", "Email đã tồn tại.");
                return View();
            }

            var user = new User
            {
                UserName = username,
                Email = email,
                PasswordHash = HashPassword(password),
                CreatedAt = DateTime.Now
            };

            _context.Users.Add(user);
            await _context.SaveChangesAsync();

            // Gán quyền mặc định là "User"
            var userRole = new UserRole
            {
                UserId = user.Id,
                RoleId = _context.Roles.FirstOrDefault(r => r.RoleName == "User")?.Id ?? 2
            };
            _context.UserRoles.Add(userRole);
            await _context.SaveChangesAsync();

            return RedirectToAction("Login");
        }

        // GET: /Account/Login
        public IActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Login(string email, string password)
        {
            var passwordHash = HashPassword(password);
            var user = await _context.Users
                .Include(u => u.UserRoles)
                .ThenInclude(ur => ur.Role)
                .FirstOrDefaultAsync(u => u.Email == email && u.PasswordHash == passwordHash);

            if (user == null)
            {
                ModelState.AddModelError("", "Sai tài khoản hoặc mật khẩu.");
                return View();
            }

            //  Lưu thông tin vào Session
            HttpContext.Session.SetInt32("UserId", user.Id);
            HttpContext.Session.SetString("UserName", user.UserName);
            HttpContext.Session.SetString("Role", user.UserRoles.FirstOrDefault()?.Role?.RoleName ?? "User");

            // Tạo claims từ user + role
            var claims = new List<Claim>
    {
        new Claim(ClaimTypes.Name, user.UserName),
        new Claim(ClaimTypes.NameIdentifier, user.Id.ToString()),
        new Claim(ClaimTypes.Email, user.Email)
    };

            foreach (var role in user.UserRoles.Select(ur => ur.Role.RoleName))
            {
                claims.Add(new Claim(ClaimTypes.Role, role));
            }

            var identity = new ClaimsIdentity(claims, CookieAuthenticationDefaults.AuthenticationScheme);
            var principal = new ClaimsPrincipal(identity);

            // Đăng nhập bằng cookie
            await HttpContext.SignInAsync(CookieAuthenticationDefaults.AuthenticationScheme, principal,
                new AuthenticationProperties
                {
                    IsPersistent = true,
                    ExpiresUtc = DateTime.UtcNow.AddMinutes(30)
                });

            return RedirectToAction("Index", "Home");
        }

        // GET: /Account/Logout
        public async Task<IActionResult> Logout()
        {
            // Xóa session nếu có
            HttpContext.Session.Clear();

            // Xóa cookie xác thực
            await HttpContext.SignOutAsync(CookieAuthenticationDefaults.AuthenticationScheme);

            return RedirectToAction("Index", "Home");
        }
        public IActionResult AccessDenied()
        {
            return View();
        }

        // Hàm mã hóa mật khẩu (SHA256)
        private string HashPassword(string password)
        {
            using (SHA256 sha = SHA256.Create())
            {
                byte[] bytes = sha.ComputeHash(Encoding.UTF8.GetBytes(password));
                return Convert.ToBase64String(bytes);
            }
        }
        public IActionResult IsLoggedIn()
        {
            return Json(new { isAuthenticated = User.Identity?.IsAuthenticated });
        }
    }
}
