using MediatR;
using MySocailApp.Application.Commands.UserDomain.UserAggregate;

namespace MySocailApp.Application.Commands.UserDomain.UserAggregate.LoginByPassword
{
    public record LoginByPasswordDto(string EmailOrUserName, string Password) : IRequest<LoginDto>;
}
