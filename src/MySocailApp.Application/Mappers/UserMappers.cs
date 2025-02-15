using AutoMapper;
using MySocailApp.Application.Commands.UserAggregate;
using MySocailApp.Application.Commands.UserAggregate.AddUserSearcher;
using MySocailApp.Application.Commands.UserAggregate.Block;
using MySocailApp.Application.Commands.UserAggregate.Follow;
using MySocailApp.Domain.UserDomain.UserAggregate.Entities;

namespace MySocailApp.Application.Mappers
{
    public class UserMappers : Profile
    {
        public UserMappers()
        {
            CreateMap<User, AccountDto>()
                .ForMember(dest => dest.Email, x => x.MapFrom(src => src.Email != null ? src.Email.Value : null))
                .ForMember(dest => dest.Language, x => x.MapFrom(src => src.Language != null ? src.Language.Value : null))
                .ForMember(dest => dest.IsEmailVerified, x => x.MapFrom(src => src.IsEmailVerified))
                .ForMember(dest => dest.IsPrivacyPolicyApproved, x => x.MapFrom(src => src.IsPrivacyPolicyApproved))
                .ForMember(dest => dest.IsTermsOfUseApproved, x => x.MapFrom(src => src.IsTersmOfUseApproved))
                .ForMember(dest => dest.IsGoogleAuthenticated, x => x.MapFrom(src => src.GoogleAccount != null));

            CreateMap<Follow, FollowCommandResponseDto>();
            CreateMap<UserSearch, AddUserSearcherCommandResponseDto>();

            

            CreateMap<Block, BlockCommandResponseDto>();
        }
    }
}
