using MediatR;
using SolTake.Application.Queries.UserDomain.GetFollowedsByUserId;
using SolTake.Core;

namespace SolTake.Application.Queries.UserDomain.GetFollowersByUserId
{
    public record GetFollowersByUserIdDto(int UserId, int? Offset, int Take, bool IsDescending) : Page(Offset, Take, IsDescending), IRequest<List<FollowResponseDto>>;
}
