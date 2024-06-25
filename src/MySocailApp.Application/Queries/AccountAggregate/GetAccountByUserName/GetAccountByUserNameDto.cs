using MediatR;

namespace MySocailApp.Application.Queries.AccountAggregate.GetAccountByUserName
{
    public record GetAccountByUserNameDto(string UserName) : IRequest<AccountResponseDto>;
}
