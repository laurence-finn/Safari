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
builder.Services.AddAutoMapper(typeof(AdminAnimalProfile));

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

app.UseAuthentication();
app.UseAuthorization();

app.MapRazorPages();

app.Run();
