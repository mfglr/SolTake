using MediatR;

namespace SolTake.Application.Commands.UserDomain.FollowAggregate.Unfollow
{
    public record UnfollowDto(int FollowedId) : IRequest;
}
