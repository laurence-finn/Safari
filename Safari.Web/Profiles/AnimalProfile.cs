using Safari.Data;
using Safari.Web.ViewModels;
using AutoMapper;

namespace Safari.Web.Profiles
{
    public class AnimalProfile : Profile
    {
        public AnimalProfile()
        {
            CreateMap<Animal, AnimalViewModel>()
                .ForMember(dest => dest.States,
                opt => opt.MapFrom(
                    src => src.AnimalState.Select(s => s.State.Name).ToList()))
                .ForMember(dest => dest.FilePath,
                opt => opt.MapFrom(src => src.AnimalPic.FilePath))
                .ForMember(dest => dest.AltText,
                opt => opt.MapFrom(src => src.AnimalPic.AltText))
                .ForMember(dest => dest.AnimalTypeName,
                opt => opt.MapFrom(src => src.AnimalType.Name))
                .ForMember(dest => dest.DietTypeName,
                opt => opt.MapFrom(src => src.DietType.Name));
        }
    }
}
