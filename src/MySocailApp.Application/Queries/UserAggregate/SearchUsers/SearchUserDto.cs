using MediatR;
using MySocailApp.Core;

namespace MySocailApp.Application.Queries.UserAggregate.SearchUsers
{
    public class SearchUserDto(string key,int? offset, int take,bool isDescending) : Pagination(offset,take,isDescending), IRequest<List<AppUserResponseDto>>
    {
        public string Key { get; private set; } = key;
    }
}
