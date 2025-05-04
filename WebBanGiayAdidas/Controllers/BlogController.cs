using Microsoft.AspNetCore.Mvc;

namespace WebBanGiayAdidas.Controllers
{
	public class BlogController : Controller
	{
		public IActionResult Index()
		{
			return View();
		}
	}
}
