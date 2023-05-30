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

        [Display (Name = "Min. Weight")]
        public double MinWeight { get; set; } = default!;

        [Display (Name = "Max. Weight")]
        public double MaxWeight { get; set; } = default!;

        [Display (Name = "Avg. Height")]
        public double Height { get; set; } = default!;

        [Display (Name = "Endangered?")]
        public bool IsEndangered { get; set; } = default!;

        [Display (Name = "Avg. Lifespan")]
        public int AverageLifeSpan { get; set; } = default!;
        public int AnimalId { get; set; }

        public List<string> States { get; set; } = default!;

        [Display (Name = "Image")]
        public string FilePath { get; set; } = default!;
        public string AltText { get; set; } = default!;

    }
}
