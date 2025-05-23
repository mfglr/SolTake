using MediatR;

namespace SolTake.Application.Commands.UserDomain.UserAggregate.LoginByGoogle
{
    public record LoginByGoogleDto(string AccessToken) : IRequest<LoginDto>;
}
