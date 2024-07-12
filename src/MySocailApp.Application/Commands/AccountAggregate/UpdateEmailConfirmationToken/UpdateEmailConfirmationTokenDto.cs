using MediatR;

namespace MySocailApp.Application.Commands.AccountAggregate.UpdateEmailConfirmationToken
{
    public record UpdateEmailConfirmationTokenDto() : IRequest<AccountDto>;
}
