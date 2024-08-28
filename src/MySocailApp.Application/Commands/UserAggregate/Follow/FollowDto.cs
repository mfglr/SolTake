using MediatR;
using MySocailApp.Application.Queries.UserAggregate;

namespace MySocailApp.Application.Commands.UserAggregate.Follow
{
    public record FollowDto(int FollowedId) : IRequest<FollowResponseDto>;
}
