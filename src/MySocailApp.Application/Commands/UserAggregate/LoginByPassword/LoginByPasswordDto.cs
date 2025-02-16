using MediatR;
using MySocailApp.Application.Commands.UserAggregate;

namespace MySocailApp.Application.Commands.UserAggregate.LoginByPassword
{
    public record LoginByPasswordDto(string EmailOrUserName, string Password) : IRequest<LoginDto>;
}
