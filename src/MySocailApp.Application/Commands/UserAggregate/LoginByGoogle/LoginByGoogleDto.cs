using MediatR;
using MySocailApp.Application.Commands.UserAggregate;

namespace MySocailApp.Application.Commands.UserAggregate.LoginByGoogle
{
    public record LoginByGoogleDto(string AccessToken) : IRequest<LoginDto>;
}
