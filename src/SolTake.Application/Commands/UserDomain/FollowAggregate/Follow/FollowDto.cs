using MediatR;

namespace SolTake.Application.Commands.UserDomain.FollowAggregate.Follow
{
    public record FollowDto(int FollowedId) : IRequest<FollowCommandResponseDto>;
}
