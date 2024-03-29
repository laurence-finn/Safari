﻿//File:  AnimalProfile.cs
//Class: AnimalProfile
//Description: AnimalProfile is a class that helps map Animal to AnimalViewModel, using AutoMapper
//It also feeds in information from other tables like AnimalPic, AnimalState, State, AnimalType, and DietType
//so that the actual names are present in the view, not the IDs.

using Safari.Data;
using Safari.Web.ViewModels;
using AutoMapper;

namespace Safari.Web.Profiles;

public class AnimalProfile : Profile
{
    //Constructor: Creates the mapping between Animal and AnimalViewModel
    public AnimalProfile()
    {
        CreateMap<Animal, AnimalViewModel>()
            .ForMember(dest => dest.States, 
            opt => opt.MapFrom(src => src.AnimalState.Select(s => s.State.Name).ToList()))
            .ForMember(dest => dest.FilePath, 
            opt => opt.MapFrom(src => GetApprovedFilePath(src)))
            .ForMember(dest => dest.AltText, 
            opt => opt.MapFrom(src => GetApprovedAltText(src)))
            .ForMember(dest => dest.AnimalTypeName, 
            opt => opt.MapFrom(src => src.AnimalType.Name))
            .ForMember(dest => dest.DietTypeName, 
            opt => opt.MapFrom(src => src.DietType.Name));
    }

    //GetApprovedFilePath: Gets the file path of the first approved animal picture, to use as a thumbnail on the table row.
    private string GetApprovedFilePath(Animal animal)
    {
        var approvedAnimalPic = animal.AnimalPic.FirstOrDefault(ap => ap.IsApproved == true);
        return approvedAnimalPic?.FilePath;
    }

    //GetApprovedAltText: Similar to GetApprovedFilePath, get the alt text of the first approved animal picture to use
    //for the thumbnail on the table row.
    private string GetApprovedAltText(Animal animal)
    {
        var approvedAnimalPic = animal.AnimalPic.FirstOrDefault(ap => ap.IsApproved == true);
        return approvedAnimalPic?.AltText;
    }
}
