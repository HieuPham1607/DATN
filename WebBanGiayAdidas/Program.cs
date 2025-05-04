using Microsoft.EntityFrameworkCore;
using WebBanGiayAdidas.Models;

namespace WebBanGiayAdidas
{
	public class Program
	{
		public static void Main(string[] args)
		{
			var builder = WebApplication.CreateBuilder(args);

			// Add services to the container.
			builder.Services.AddControllersWithViews();

			builder.Services.AddDistributedMemoryCache();
			builder.Services.AddSession(options =>
			{
				options.IdleTimeout = TimeSpan.FromMinutes(30); 
				options.Cookie.HttpOnly = true;
				options.Cookie.IsEssential = true;
			});

			var connectionString = builder.Configuration.GetConnectionString("AppConnectionString");
			builder.Services.AddDbContext<WebBanGiayAdidasContext>(x => x.UseSqlServer(connectionString));

			var app = builder.Build();

			if (!app.Environment.IsDevelopment())
			{
				app.UseExceptionHandler("/Home/Error");
				app.UseHsts();
			}

			app.UseHttpsRedirection();
			app.UseStaticFiles();
			app.UseRouting();

			app.UseSession();

			app.UseAuthorization();

			app.MapControllerRoute(
				name: "areas",
				pattern: "{area:exists}/{controller=Dashboard}/{action=Index}/{id?}");

			app.MapControllerRoute(
				name: "ShopCart",
				pattern: "gio-hang/{alias?}",
				defaults: new { controller = "ShopCart", action = "Index" });

			app.MapControllerRoute(
				name: "News",
				pattern: "tin-tuc/{alias?}",
				defaults: new { controller = "New", action = "Index" });

			app.MapControllerRoute(
				name: "Contact",
				pattern: "lien-he/{alias?}",
				defaults: new { controller = "Contact", action = "Index" });

			app.MapControllerRoute(
				name: "Blog",
				pattern: "bai-viet/{alias?}",
				defaults: new { controller = "Blog", action = "Index" });

			app.MapControllerRoute(
				name: "Home",
				pattern: "trang-chu/{alias?}",
				defaults: new { controller = "Home", action = "Index" });

			app.MapControllerRoute(
				name: "Product",
				pattern: "san-pham/{alias?}",
				defaults: new { controller = "Product", action = "Index" });

			app.MapControllerRoute(
				name: "ProductCategory",
				pattern: "danh-muc-san-pham/{alias}-{id}",
				defaults: new { controller = "Product", action = "ProductCategory" });

			app.MapControllerRoute(
				name: "DetailProduct",
				pattern: "chi-tiet/{alias}-p{id}",
				defaults: new { controller = "Product", action = "Detail" });

			app.MapControllerRoute(
				name: "default",
				pattern: "{controller=Home}/{action=Index}/{id?}");

			app.Run();
		}
	}
}
