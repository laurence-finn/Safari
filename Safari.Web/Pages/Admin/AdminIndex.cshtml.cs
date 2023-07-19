using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace Safari.Web.Pages.Admin
{
    [Authorize]
    public class AdminIndexPageModel : PageModel
    {
        public void OnGet()
        {
        }
    }
}
