using MediatR;
using MySocailApp.Application.Queries.UserDomain.UserAggregate;
using MySocailApp.Core;

namespace MySocailApp.Application.Queries.UserDomain.UserAggregate.SearchUsers
{
    public class SearchUserDto(string key, int offset, int take, bool isDescending) : Page(offset, take, isDescending), IRequest<List<UserResponseDto>>
    {
        public string Key { get; private set; } = key;
    }
}
