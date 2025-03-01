using MediatR;
using MySocailApp.Application.Commands.UserDomain.UserAggregate;

namespace MySocailApp.Application.Commands.UserDomain.UserAggregate.LoginByGoogle
{
    public record LoginByGoogleDto(string AccessToken) : IRequest<LoginDto>;
}
