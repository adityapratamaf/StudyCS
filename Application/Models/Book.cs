using Microsoft.EntityFrameworkCore.Metadata.Internal;

namespace Application.Models
{
    public class Book
    {
        public int Id { get; set; }
        public string Name_Book { get; set; } = string.Empty;
        public string Status { get; set; } = string.Empty;
        public string Author { get; set; } = string.Empty;
        public string Publisher { get; set; } = string.Empty;
        public string Synopsis { get; set; } = string.Empty;
        public int GenreId { get; set; }  // relasi dengan Genre
        public Genre? Genre { get; set; }  // properti navigasi ke Genre
    }
}
