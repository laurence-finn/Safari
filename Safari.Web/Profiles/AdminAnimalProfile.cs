using AutoMapper;
using Safari.Data;
using Safari.Web.ViewModels;

namespace Safari.Web.Profiles
{
    public class AdminAnimalProfile : Profile
    {
        public AdminAnimalProfile()
        {
            CreateMap<Animal, AdminAnimalViewModel>()
                .ForMember(dest => dest.States,
                               opt => opt.MapFrom(
                                                      src => src.AnimalState.Select(s => s.State.Name).ToList()))
                .ForMember(dest => dest.FilePath,
                               opt => opt.MapFrom(src => src.AnimalPic.FirstOrDefault().FilePath))
                .ForMember(dest => dest.AltText,
                               opt => opt.MapFrom(src => src.AnimalPic.FirstOrDefault().AltText))
                .ForMember(dest => dest.AnimalTypeName,
                               opt => opt.MapFrom(src => src.AnimalType.Name))
                .ForMember(dest => dest.DietTypeName,
                               opt => opt.MapFrom(src => src.DietType.Name));
        }
    }
}
