namespace Application.Models
{
    public class Genre
    {
        public int Id { get; set; }
        public string Name_Genre { get; set; } = string.Empty;

        // Navigasi Table Books
        public ICollection<Book> Books { get; set; } = new List<Book>();
    }
}
