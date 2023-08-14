//File: Index.cshtml.cs
//Class: IndexPageModel
//Description: This is the code-behind class for the Index page. It is used to handle the GET request for the Index page.
//Beyond tracking usage by logging, this class does not do anything else, and may be removed in the future.

using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace Safari.Web.Pages
{
    public class IndexPageModel : PageModel
    {
        private readonly ILogger<IndexPageModel> _logger;

        public IndexPageModel(ILogger<IndexPageModel> logger)
        {
            _logger = logger;
        }

        public void OnGet()
        {

        }
    }
}