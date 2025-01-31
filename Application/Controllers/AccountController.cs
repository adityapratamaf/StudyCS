using Application.Data;
using Application.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Application.Controllers
{
    public class AccountController : Controller
    {
        private readonly ApplicationDbContext _context;

        public AccountController(ApplicationDbContext context)
        {
            _context = context;
        }

        [HttpGet]
        public IActionResult Login()
        {
            return View();
        }

        // untuk memproses form login (POST request)
        [HttpPost]
        public IActionResult Store(string username, string password)
        {
            // Cek pengguna di database
            var user = _context.Users.FirstOrDefault(u => u.Username == username && u.Password == password);

            if (user != null)
            {
                // Jika pengguna valid, simpan ke session
                HttpContext.Session.SetString("Username", user.Username);
                return RedirectToAction("Index", "Home"); // Redirect ke halaman utama setelah login berhasil
            }
            else
            {
                ViewBag.Message = "Invalid username or password"; // Pesan jika login gagal
                return View();
            }
        }

        // untuk logout (menghapus session dan redirect ke login page)
        [HttpGet]
        public IActionResult Logout()
        {
            // Menghapus semua data dari session (termasuk username)
            HttpContext.Session.Clear();

            // Redirect ke halaman login setelah logout
            return RedirectToAction("Login");
        }

    }
}
