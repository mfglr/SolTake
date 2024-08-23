using MediatR;
using MySocailApp.Core;

namespace MySocailApp.Application.Queries.UserAggregate.GetFollowersById
{
    public class GetFollowersByIdDto(int id, int? offset, int take,bool isDescending) : Pagination(offset,take,isDescending), IRequest<List<AppUserResponseDto>>
    {
        public int Id { get; private set; } = id;
    }
}
