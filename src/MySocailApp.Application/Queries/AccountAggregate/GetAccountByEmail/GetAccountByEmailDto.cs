using MediatR;

namespace MySocailApp.Application.Queries.AccountAggregate.GetAccountByEmail
{
    public record GetAccountByEmailDto(string Email) : IRequest<AccountResponseDto>;
}
