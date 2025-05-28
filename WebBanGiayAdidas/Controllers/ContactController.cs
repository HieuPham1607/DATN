using Microsoft.AspNetCore.Mvc;
using WebBanGiayAdidas.Models;

namespace WebBanGiayAdidas.Controllers
{
    public class ContactController : Controller
    {
        private readonly WebBanGiayAdidasContext _context;

        public ContactController(WebBanGiayAdidasContext context)
        {
            _context = context;
        }

        [HttpGet]
        public IActionResult Index()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Index(Contact contact)
        {
            if (ModelState.IsValid)
            {
                contact.CreatedDate = DateTime.Now;
                contact.Read = false;
                _context.Contacts.Add(contact);
                _context.SaveChanges();
                ViewBag.Message = "Cảm ơn bạn đã liên hệ!";
                ModelState.Clear();
                return View();
            }
            return View(contact);
        }
    }
}
