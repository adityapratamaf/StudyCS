using Microsoft.EntityFrameworkCore;
using Application.Models;

namespace Application.Data
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
            : base(options)
        {
        }

        //Deklarasi Tabel
        public DbSet<Genre>? Genres { get; set; }
        public DbSet<Book>? Books { get; set; }

        //Relasi Tabel
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            // eksplisit menentukan relasi
            modelBuilder.Entity<Book>()
                .HasOne(b => b.Genre)
                .WithMany(g => g.Books)
                .HasForeignKey(b => b.GenreId)
                .OnDelete(DeleteBehavior.Cascade);
        }
    }
}
