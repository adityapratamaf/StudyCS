using Application.Data;
using Application.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using static System.Formats.Asn1.AsnWriter;

namespace Application.Controllers
{
    public class GenreController : Controller
    {

        private readonly ApplicationDbContext _context;

        // konstruktor untuk menyuntikkan DbContext
        public GenreController(ApplicationDbContext context)
        {
            _context = context;
        }

        public IActionResult Index()
        {
            // periksa apakah _context.Genres tidak null
            if (_context.Genres == null)
            {
                return NotFound("genres not found.");
            }

            string sql = "SELECT * FROM Genres";
            var genres = _context.Genres.FromSqlRaw(sql).ToList() ?? new List<Genre>();

            return View(genres);
        }

        public IActionResult Store(Genre model) 
        {
            if (ModelState.IsValid) 
            {
                _context.Genres.Add(model);
                _context.SaveChanges();
                TempData["SuccessMessage"] = "data seccessfully added !";
            }
            return RedirectToAction("Index");
        }

        public IActionResult Delete(int id)
        {
            // periksa apakah _context.Genres tidak null
            if (_context.Genres == null)
            {
                return NotFound("genres not found.");
            }

            // mencari data berdasarkan ID
            var item = _context.Genres.FirstOrDefault(g => g.Id == id);

            // jika data ditemukan
            if (item != null)
            {
                _context.Genres.Remove(item);
                _context.SaveChanges();
                TempData["SuccessMessage"] = "data successfully deleted !";
            }

            return RedirectToAction("Index");
        }

        public IActionResult Search(string query)
        { 
            // form kosong, kembalikan semua data
            if (string.IsNullOrEmpty(query))
            {
                var allData = _context.Genres.ToList();
                return View("Index", allData);
            }

            // form tidak kosong 
            var results = _context.Genres.Where(s => s.Name_Genre.Contains(query)).ToList();
            return View("Index", results);
        }

    }
}
