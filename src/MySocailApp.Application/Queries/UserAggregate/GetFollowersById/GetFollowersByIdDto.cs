using MediatR;
using MySocailApp.Core;

namespace MySocailApp.Application.Queries.UserAggregate.GetFollowersById
{
    public class GetFollowersByIdDto(int userId, int? offset, int take, bool isDescending) : Page(offset,take,isDescending), IRequest<List<FollowResponseDto>>
    {
        public int UserId { get; private set; } = userId;
    }
}
