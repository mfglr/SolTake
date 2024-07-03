using AutoMapper;
using MySocailApp.Application.Commands.AccountAggregate;
using MySocailApp.Domain.AccountAggregate;

namespace MySocailApp.Application.Mappers
{
    public class AccountMappers : Profile
    {
        public AccountMappers()
        {
            CreateMap<Account, AccountDto>();
        }
    }
}
