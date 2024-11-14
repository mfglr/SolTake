using AutoMapper;
using MySocailApp.Application.Commands.AccountAggregate;
using MySocailApp.Domain.AccountAggregate.Entities;

namespace MySocailApp.Application.Mappers
{
    public class AccountMappers : Profile
    {
        public AccountMappers()
        {
            CreateMap<Account, AccountDto>()
                .ForMember(dest => dest.EmailConfirmed, x => x.MapFrom(src => src.IsEmailVerified))
                .ForMember(dest => dest.IsPrivacyPolicyApproved, x => x.MapFrom(src => src.IsPrivacyPolicyApproved))
                .ForMember(dest => dest.IsTermsOfUseApproved, x => x.MapFrom(src => src.IsTersmOfUseApproved));
        }
    }
}
