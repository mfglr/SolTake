using AccountDomain.Entities;
using AutoMapper;
using MySocailApp.Application.Commands.AccountAggregate;
using MySocailApp.Application.Commands.AccountAggregate.Block;

namespace MySocailApp.Application.Mappers
{
    public class AccountMappers : Profile
    {
        public AccountMappers()
        {
            CreateMap<Account, AccountDto>()
                .ForMember(dest => dest.Email, x => x.MapFrom(src => src.Email != null ? src.Email.Value : null))
                .ForMember(dest => dest.UserName, x => x.MapFrom(src => src.UserName != null ? src.UserName.Value : null))
                .ForMember(dest => dest.Language, x => x.MapFrom(src => src.Language != null ? src.Language.Value : null))
                .ForMember(dest => dest.IsEmailVerified, x => x.MapFrom(src => src.IsEmailVerified))
                .ForMember(dest => dest.IsPrivacyPolicyApproved, x => x.MapFrom(src => src.IsPrivacyPolicyApproved))
                .ForMember(dest => dest.IsTermsOfUseApproved, x => x.MapFrom(src => src.IsTersmOfUseApproved))
                .ForMember(dest => dest.IsGoogleAuthenticated, x => x.MapFrom(src => src.GoogleAccount != null));

            CreateMap<Block,BlockCommandResponseDto>();
        }
    }
}
