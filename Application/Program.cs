using Microsoft.EntityFrameworkCore;
using Application.Data;

var builder = WebApplication.CreateBuilder(args);

// Tambahkan layanan Session
builder.Services.AddDistributedMemoryCache(); // Penyimpanan sementara untuk session
builder.Services.AddSession(options =>
{
    options.IdleTimeout = TimeSpan.FromMinutes(30); // Tentukan timeout sesi jika perlu
    options.Cookie.HttpOnly = true;  // Mencegah JavaScript mengakses cookie session
    options.Cookie.IsEssential = true; // Pastikan cookie session disertakan dalam permintaan
});

// Add services to the container.
builder.Services.AddControllersWithViews();

// menambahkan DbContext dengan konfigurasi koneksi MySQL
builder.Services.AddDbContext<ApplicationDbContext>(options =>
    options.UseMySql(
        builder.Configuration.GetConnectionString("DefaultConnection"),
        ServerVersion.AutoDetect(builder.Configuration.GetConnectionString("DefaultConnection"))
    )
);

var app = builder.Build();

// Aktifkan session middleware
app.UseSession();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();

app.UseAuthorization();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");

app.Run();
