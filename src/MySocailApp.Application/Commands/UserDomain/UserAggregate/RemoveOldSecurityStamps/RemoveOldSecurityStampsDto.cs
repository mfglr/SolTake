using MediatR;

namespace MySocailApp.Application.Commands.UserDomain.UserAggregate.RemoveOldSecurityStamps
{
    public record RemoveOldSecurityStampsDto(int Id, string RefreshToken) : IRequest;
}
