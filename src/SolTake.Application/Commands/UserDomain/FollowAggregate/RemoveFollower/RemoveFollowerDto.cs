using MediatR;

namespace SolTake.Application.Commands.UserDomain.UserAggregate.RemoveFollower
{
    public record RemoveFollowerDto(int FollowerId) : IRequest;
}
