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
                .ForMember(dest => dest.FilePathFileName,
                opt => opt.MapFrom(src => Path.Combine(src.AnimalPic.FilePath, src.AnimalPic.FileName)))
                .ForMember(dest => dest.AltText,
                opt => opt.MapFrom(src => src.AnimalPic.AltText));
        }
    }
}
