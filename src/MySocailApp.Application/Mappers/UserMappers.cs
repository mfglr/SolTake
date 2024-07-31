using AutoMapper;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Application.Queries.UserAggregate;
using MySocailApp.Domain.AppUserAggregate.Entities;

namespace MySocailApp.Application.Mappers
{
    public class UserMappers : Profile
    {
        public UserMappers(IAccessTokenReader tokenReader)
        {
            CreateMap<AppUser, AppUserResponseDto>()
                .ForMember(dest => dest.UserName, opt => opt.MapFrom(src => src.Account.UserName))
                .ForMember(dest => dest.NumberOfUnviewedNotifications, opt => opt.MapFrom(src => src.Noitifications.Count(x => !x.IsViewed)))
                .ForMember(dest => dest.NumberOfQuestions, opt => opt.MapFrom(src => src.Questions.Count))
                .ForMember(dest => dest.NumberOfFollowers, opt => opt.MapFrom(src => src.Followers.Count))
                .ForMember(dest => dest.NumberOfFolloweds, opt => opt.MapFrom(src => src.Followeds.Count))
                .ForMember(dest => dest.IsFollower, opt => opt.MapFrom(src => src.Followeds.Any(x => x.FollowedId == tokenReader.GetAccountId())))
                .ForMember(dest => dest.IsFollowed, opt => opt.MapFrom(src => src.Followers.Any(x => x.FollowerId == tokenReader.GetAccountId())))
                .ForMember(dest => dest.IsRequester, opt => opt.MapFrom(src => src.Requesters.Any(x => x.RequesterId == tokenReader.GetAccountId())))
                .ForMember(dest => dest.IsRequested, opt => opt.MapFrom(src => src.Requesteds.Any(x => x.RequestedId == tokenReader.GetAccountId())));
        }

        public UserMappers() { }
    }
}
