using AutoMapper;
using MySocailApp.Application.Commands.AccountAggregate;
using MySocailApp.Domain.AccountAggregate;

namespace MySocailApp.Application.Mappers
{
    public class AccountMappers : Profile
    {
        public AccountMappers()
        {
            CreateMap<Account, AccountDto>()
                .ForMember(dest => dest.AccessToken, x => x.MapFrom(src => src.Token.AccessToken))
                .ForMember(dest => dest.RefreshToken, x => x.MapFrom(src => src.Token.RefreshToken));
        }
    }
}
