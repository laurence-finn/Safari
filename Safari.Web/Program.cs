using Microsoft.EntityFrameworkCore;
using Safari.Data;
using System.Configuration;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
var connection = builder.Configuration.GetConnectionString("WildlifeDataConnection");
builder.Services.AddDbContext<WildlifeDataContext>(options =>
        options.UseSqlServer(connection));
builder.Services.AddDatabaseDeveloperPageExceptionFilter();

builder.Services.AddRazorPages();

var app = builder.Build();

// If the app isn't running in development mode, display the error page.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Error");
    app.UseHsts();
}

WildlifeDataContext wild = new WildlifeDataContext(connection);

app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();

app.UseAuthorization();

app.MapRazorPages();

app.Run();
