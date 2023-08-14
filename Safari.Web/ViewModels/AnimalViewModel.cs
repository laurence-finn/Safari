//File: AnimalViewModel.cs
//Class: AnimalViewModel
//Description: AnimalViewModel is a model that stores Animal information. Using the AnimalProfile and AutoMapper, it is filled with information
//mapped from the rest of the database.

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

        //AnimalViewModel only needs the first approved picture, which is used as a thumbnail on the table row.
        //Because of this, an AnimalPic object isn't needed; just the file path and alt text.
        [Display (Name = "Image")]
        public string FilePath { get; set; } = default!;
        public string AltText { get; set; } = default!;        

        //Date Submitted and Approval Status are included in the AnimalViewModel, but are only used in the Admin view.
        [Display (Name = "Date Submitted")]
        public DateTime DateSubmitted { get; set; } = default!;

        [Display(Name = "Approval Status")]
        public bool IsApproved { get; set; } = default!;
    }
}
