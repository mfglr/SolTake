using AutoMapper;
using MySocailApp.Application.Queries.UserAggregate;
using MySocailApp.Application.Services;
using MySocailApp.Domain.AppUserAggregate;

namespace MySocailApp.Application.Mappers
{
    public class UserMappers : Profile
    {
        public UserMappers(IAccessTokenReader accessTokenReader)
        {
            CreateMap<AppUser, AppUserResponseDto>()
                .ForMember(dest => dest.NumberOfPosts, opt => opt.MapFrom(src => src.Posts.Count))
                .ForMember(dest => dest.NumberOfFollowers, opt => opt.MapFrom(src => src.Followers.Count))
                .ForMember(dest => dest.NumberOfFolloweds, opt => opt.MapFrom(src => src.Followeds.Count))
                .ForMember(dest => dest.IsFollower, opt => opt.MapFrom(src => src.Followeds.Any(x => x.FollowedId == accessTokenReader.GetAccountId())))
                .ForMember(dest => dest.IsFollowed, opt => opt.MapFrom(src => src.Followers.Any(x => x.FollowerId == accessTokenReader.GetAccountId())));
        }

        public UserMappers() { }
    }
}
