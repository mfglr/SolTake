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
                .ForMember(dest => dest.EmailConfirmed, x => x.MapFrom(src => src.IsThirdPartyAuthenticated || src.VerificationTokens.OrderByDescending(x => x.Id).First().IsVerified))
                .ForMember(dest => dest.IsPrivacyPolicyApproved, x => x.MapFrom(src => src.PrivacyPolicies.OrderByDescending(x => x.PolicyId).First().IsApproved))
                .ForMember(dest => dest.IsTermsOfUseApproved, x => x.MapFrom(src => src.TermsOfUses.OrderByDescending(x => x.TermsOfUseId).First().IsApproved));;
        }
    }
}
