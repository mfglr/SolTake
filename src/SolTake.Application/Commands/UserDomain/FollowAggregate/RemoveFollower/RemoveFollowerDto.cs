using MediatR;

namespace MySocailApp.Application.Commands.UserDomain.UserAggregate.RemoveFollower
{
    public record RemoveFollowerDto(int FollowerId) : IRequest;
}
