using AutoMapper;
using SolTake.Application.Queries.AppVersionAggregate;
using SolTake.Domain.AppVersionAggregate.Entities;

namespace SolTake.Application.Mappers
{
    public class AppVersionMappers : Profile
    {
        public AppVersionMappers()
        {
            CreateMap<AppVersion, AppVersionResponseDto>()
                .ForMember(dest => dest.VersionCode, x => x.MapFrom(src => src.Code.Value));
        }
    }
}
