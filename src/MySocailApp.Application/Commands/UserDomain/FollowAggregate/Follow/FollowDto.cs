using MediatR;

namespace MySocailApp.Application.Commands.UserDomain.FollowAggregate.Follow
{
    public record FollowDto(int FollowedId) : IRequest<FollowCommandResponseDto>;
}
