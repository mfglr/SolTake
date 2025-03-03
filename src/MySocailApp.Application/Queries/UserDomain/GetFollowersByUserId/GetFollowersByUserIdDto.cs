using MediatR;
using MySocailApp.Core;

namespace MySocailApp.Application.Queries.UserDomain.GetFollowersByUserId
{
    public class GetFollowersByUserIdDto(int userId, int? offset, int take, bool isDescending) : Page(offset, take, isDescending), IRequest<List<FollowerResponseDto>>
    {
        public int UserId { get; private set; } = userId;
    }
}
