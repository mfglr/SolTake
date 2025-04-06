using MediatR;
using MySocailApp.Application.Queries.UserDomain.GetFollowedsByUserId;
using MySocailApp.Core;

namespace MySocailApp.Application.Queries.UserDomain.GetFollowersByUserId
{
    public record GetFollowersByUserIdDto(int UserId, int? Offset, int Take, bool IsDescending) : Page(Offset, Take, IsDescending), IRequest<List<FollowResponseDto>>;
}
