using MediatR;

namespace MySocailApp.Application.Commands.UserAggregate.Follow
{
    public record FollowDto(int FollowedId) : IRequest;
}
