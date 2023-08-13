//File: AdminIndex.cshtml.cs
//Class: AdminIndexPageModel
//Description: This is the code-behind class for the AdminIndex Razor Page.

using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace Safari.Web.Pages.Admin
{
    //Only users with the Admin role can access this page.
    [Authorize]
    public class AdminIndexPageModel : PageModel
    {
        //No additional code is required for an HTTP GET request on the Admin Index page.
        public void OnGet()
        {
        }
    }
}
