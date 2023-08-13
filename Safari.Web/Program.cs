//File: Program.cs
//Class: Program
//Description: This is the main entry point of the application and serves as the "Main" class for any ASP.NET Core application.
//In previous versions of ASP.NET, this class was called "Startup.cs". This class configures the application and injects services
//and dependencies.

using Microsoft.EntityFrameworkCore;
using Safari.Data;
using AutoMapper;
using Safari.Web.Profiles;
using Microsoft.AspNetCore.Identity;
using Safari.Data;

var builder = WebApplication.CreateBuilder(args);

// Check the environment: if dev, use the dev connection string, otherwise use the prod connection string.
// The prod connection string will be stored in Azure Key Vault at a later date.
var environment = builder.Environment;
string connection;

if (environment.IsDevelopment())
{
    connection = builder.Configuration.GetConnectionString("WildlifeDataConnection");
}
else
{
    connection = builder.Configuration.GetConnectionString("WildlifeDataConnectionProd");
}

// Add services to the container.
builder.Services.AddDbContext<WildlifeDataContext>(options =>
    options.UseSqlServer(connection));

builder.Services.AddDefaultIdentity<IdentityUser>(options => options.SignIn.RequireConfirmedAccount = true)
    .AddEntityFrameworkStores<WildlifeDataContext>();

builder.Services.AddScoped<IWildlifeRepository, WildlifeRepository>();

builder.Services.AddAutoMapper(typeof(AnimalProfile));

builder.Services.AddRazorPages();

// After the services have been added to the container, create an app instance.
var app = builder.Build();

// If the app isn't running in development mode, use the error handler and HSTS.
// (HSTS is HTTP Strict Transport Security, which forces browsers to use HTTPS.)
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Error");
    app.UseHsts();
}

// Use HTTPS Redirection, Static Files, Routing, Authentication, Authorization, and Razor Pages with the app instance.
app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();

app.UseAuthentication();
app.UseAuthorization();

app.MapRazorPages();

// Run the app.
app.Run();
