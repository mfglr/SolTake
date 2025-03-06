using MediatR;
using MySocailApp.Core;

namespace MySocailApp.Application.Queries.UserDomain.SearchUsers
{
    public class SearchUserDto(string key, int? offset, int take, bool isDescending) : Page(offset, take, isDescending), IRequest<List<SearchUserResponseDto>>
    {
        public string Key { get; private set; } = key;
    }
}
