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
                .ForMember(dest => dest.UserName, opt => opt.MapFrom(src => src.Account.UserName))
                .ForMember(dest => dest.NumberOfQuestions, opt => opt.MapFrom(src => src.Questions.Count))
                .ForMember(dest => dest.NumberOfFollowers, opt => opt.MapFrom(src => src.Followers.Count))
                .ForMember(dest => dest.NumberOfFolloweds, opt => opt.MapFrom(src => src.Followeds.Count))
                .ForMember(dest => dest.IsFollower, opt => opt.MapFrom(src => src.Followeds.Any(x => x.FollowedId == accessTokenReader.GetAccountId())))
                .ForMember(dest => dest.IsFollowed, opt => opt.MapFrom(src => src.Followers.Any(x => x.FollowerId == accessTokenReader.GetAccountId())))
                .ForMember(dest => dest.IsRequester, opt => opt.MapFrom(src => src.Requesters.Any(x => x.RequesterId == accessTokenReader.GetAccountId())))
                .ForMember(dest => dest.IsRequested, opt => opt.MapFrom(src => src.Requesteds.Any(x => x.RequestedId == accessTokenReader.GetAccountId())));
        }

        public UserMappers() { }
    }
}
