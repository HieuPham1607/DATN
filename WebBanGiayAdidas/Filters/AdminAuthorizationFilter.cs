using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;

namespace WebBanGiayAdidas.Filters
{
    public class AdminAuthorizationFilter : IAuthorizationFilter
    {
        public void OnAuthorization(AuthorizationFilterContext context)
        {
            // Lấy quyền của người dùng từ session
            var role = context.HttpContext.Session.GetString("Role");

            // Nếu không phải Admin, chuyển hướng người dùng về trang chủ
            if (role != "Admin")
            {
                context.Result = new RedirectToActionResult("Index", "Home", null); // Chuyển hướng về trang chủ
            }
        }
    }
}
