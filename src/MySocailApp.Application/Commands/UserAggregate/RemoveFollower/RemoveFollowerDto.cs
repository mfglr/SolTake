using MediatR;

namespace MySocailApp.Application.Commands.UserAggregate.RemoveFollower
{
    public record RemoveFollowerDto(int FollowerId) : IRequest;
}
