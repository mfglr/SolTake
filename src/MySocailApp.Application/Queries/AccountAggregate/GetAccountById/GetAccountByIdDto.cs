using MediatR;

namespace MySocailApp.Application.Queries.AccountAggregate.GetAccountById
{
    public record GetAccountByIdDto(string Id) : IRequest<AccountResponseDto>;
}
