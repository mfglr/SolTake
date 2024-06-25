using MediatR;

namespace MySocailApp.Application.Commands.UserAggregate.Unfollow
{
    public record UnfollowDto(string FollowedId) : IRequest;
}
