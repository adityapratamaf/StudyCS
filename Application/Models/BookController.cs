using System.Runtime.CompilerServices;
using Microsoft.AspNetCore.Mvc;
using Application.Data;
using Microsoft.EntityFrameworkCore;
using Application.Models;
using Microsoft.AspNetCore.Http;

namespace Application.Models
{
    public class BookController : Controller
    {

        private readonly ApplicationDbContext _context;

        public BookController(ApplicationDbContext context)
        {
            _context = context;
        }

        public IActionResult Index()
        {
            var books = _context.Books.Include(b => b.Genre).ToList();
            return View(books);
        }

        public IActionResult Search(string query)
        {
            if (string.IsNullOrWhiteSpace(query))
            {
                var allBooks = _context.Books.Include(b => b.Genre).ToList();
                return View("Index", allBooks);
            }

            var results = _context.Books
                            .Include(b => b.Genre)
                            .Where(b => b.Name_Book.Contains(query))
                            .ToList();

            return View("Index", results);
        }

        public IActionResult Create()
        {
            // parsing data genre
            ViewBag.Genres = _context.Genres.ToList();
            return View();
        }

        public IActionResult Store(Book model)
        {
            if (ModelState.IsValid)
            {
                // cek genre diatur dengan nilai yang valid 
                model.Genre = _context.Genres.FirstOrDefault(g => g.Id == model.GenreId);
                // tambah data & simpan ke database
                _context.Books.Add(model);
                _context.SaveChanges();
                // notifikasi
                TempData["SuccessMessage"] = "data seccessfully added !";
                return RedirectToAction("Index");
            }
            // jika data tidak valid, kirim data genre untuk dropdown
            ViewBag.Genres = _context.Genres.ToList();
            return RedirectToAction("Create", model);
        }

        public IActionResult Detail(int id)
        {
            var item = _context.Books.FirstOrDefault(b => b.Id == id);

            if (item == null)
            {
                return NotFound();
            }
            ViewBag.Genres = _context.Genres.ToList();
            return View(item);
        }

        public IActionResult Edit (int id)
        {
            var item = _context.Books.FirstOrDefault(b => b.Id == id);
            
            if (item != null)
            {
                ViewBag.Genres = _context.Genres.ToList();
                return View("Edit", item);
            }
            return RedirectToAction("Index");
        }

        public IActionResult Update(Book model)
        {
            if (ModelState.IsValid)
            {
                var item = _context.Books.FirstOrDefault(b => b.Id == model.Id);

                if (item != null)
                {
                    item.Name_Book = model.Name_Book;
                    item.Status = model.Status;
                    item.Author = model.Author;
                    item.Publisher = model.Publisher;
                    item.Synopsis = model.Synopsis;
                    item.GenreId = model.GenreId;

                    _context.SaveChanges();
                    TempData["SuccessMessage"] = "data successfully updated";
                    return RedirectToAction("Index");
                }
                TempData["ErrorMessage"] = "data not found";
                return RedirectToAction("Index");
            }
            ViewBag.Genres = _context.Genres.ToList();
            TempData["ErrorMessage"] = "data successfully updated";
            return RedirectToAction("Edit", model);
        }

        public IActionResult Delete(int id)
        {
            // mencari data berdasarkan ID
            var item = _context.Books.FirstOrDefault(b => b.Id == id);

            // jika data ditemukan
            if (item != null)
            {
                _context.Books.Remove(item);
                _context.SaveChanges();
                TempData["SuccessMessage"] = "data successfully deleted !";
            }
            return RedirectToAction("Index");
        }

    }
}
