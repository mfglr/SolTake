using MediatR;

namespace MySocailApp.Application.Commands.AccountAggregate.LoginByGoogle
{
    public record LoginByGoogleDto(string AccessToken) : IRequest<AccountDto>;
}
