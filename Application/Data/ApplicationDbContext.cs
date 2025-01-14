﻿using Microsoft.EntityFrameworkCore;
using Application.Models;

namespace Application.Data
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
            : base(options)
        {
        }

        public DbSet<Genre>? Genres { get; set; }
    }
}
