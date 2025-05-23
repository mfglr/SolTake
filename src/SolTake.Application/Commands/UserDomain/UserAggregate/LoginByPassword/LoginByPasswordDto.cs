using MediatR;

namespace SolTake.Application.Commands.UserDomain.UserAggregate.LoginByPassword
{
    public record LoginByPasswordDto(string EmailOrUserName, string Password) : IRequest<LoginDto>;
}
