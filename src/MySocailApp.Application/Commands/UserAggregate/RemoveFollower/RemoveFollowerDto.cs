using MediatR;

namespace MySocailApp.Application.Commands.UserAggregate.RemoveFollower
{
    public record RemoveFollowerDto(string FollowerId) : IRequest;
}
