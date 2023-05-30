using Microsoft.EntityFrameworkCore;
using Safari.Data;
using AutoMapper;
using Safari.Web.Profiles;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
var connection = builder.Configuration.GetConnectionString("WildlifeDataConnection");
builder.Services.AddDbContext<WildlifeDataContext>(options =>
    options.UseSqlServer(connection));

builder.Services.AddAutoMapper(typeof(AnimalProfile));

builder.Services.AddRazorPages();

var app = builder.Build();

// If the app isn't running in development mode, display the error page.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Error");
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();

app.UseAuthorization();

app.MapRazorPages();

app.Run();
