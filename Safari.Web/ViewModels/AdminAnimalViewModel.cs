using System.ComponentModel.DataAnnotations;

namespace Safari.Web.ViewModels
{
    public class AdminAnimalViewModel : AnimalViewModel
    {
        [Display (Name = "Approval Status")]
        public bool IsApproved { get; set; } = default!;
    }
}
