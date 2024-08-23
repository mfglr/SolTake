using MediatR;
using MySocailApp.Core;

namespace MySocailApp.Application.Queries.UserAggregate.GetFollowedsById
{
    public class GetFollowedsByIdDto(int id, int? offset, int take,bool isDescending) : Pagination(offset,take,isDescending), IRequest<List<AppUserResponseDto>>
    {
        public int Id { get; private set; } = id;
    }
}
