using MediatR;

namespace MySocailApp.Application.Commands.AccountAggregate.LoginByFaceBook
{
    public record LoginByFaceBookDto(string AccessToken) : IRequest<AccountDto>;
}
