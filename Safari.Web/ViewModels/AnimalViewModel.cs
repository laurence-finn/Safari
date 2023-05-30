using Safari.Data;
using System.ComponentModel.DataAnnotations;

namespace Safari.Web.ViewModels
{
    public class AnimalViewModel
    {
        public string Name { get; set; }

        [Display (Name = "Type")]
        public string AnimalTypeName { get; set; } = default!;

        [Display (Name = "Diet")]
        public string DietTypeName { get; set; } = default!;

        public double Weight { get; set; } = default!;
        public double Height { get; set; } = default!;
        public double Length { get; set; } = default!;

        [Display (Name = "Endangered?")]
        public bool IsEndangered { get; set; } = default!;

        [Display (Name = "Lifespan")]
        public int Lifespan { get; set; } = default!;

        public int AnimalId { get; set; }

        [Display (Name="State(s)")]
        public List<string> States { get; set; } = default!;

        [Display (Name = "Image")]
        public string FilePath { get; set; } = default!;
        public string AltText { get; set; } = default!;

    }
}
