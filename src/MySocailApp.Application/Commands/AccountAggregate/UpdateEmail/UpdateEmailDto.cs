using MediatR;

namespace MySocailApp.Application.Commands.AccountAggregate.UpdateEmail
{
    public record UpdateEmailDto(string Email) : IRequest<AccountDto>;
}
