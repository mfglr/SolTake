using MediatR;

namespace MySocailApp.Application.Commands.UserDomain.FollowAggregate.Unfollow
{
    public record UnfollowDto(int FollowedId) : IRequest;
}
