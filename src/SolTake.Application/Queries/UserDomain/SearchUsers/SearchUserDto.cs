using MediatR;
using SolTake.Core;

namespace MySocailApp.Application.Queries.UserDomain.SearchUsers
{
    public record SearchUserDto(string Key, int? Offset, int Take, bool IsDescending) : Page(Offset, Take, IsDescending), IRequest<List<SearchUserResponseDto>>;
}
