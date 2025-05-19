using MediatR;
using SolTake.Core;

namespace MySocailApp.Application.Queries.UserDomain.GetUsersSearched
{
    public record GetUsersSearchedDto(int? Offset, int Take, bool IsDescending) : Page(Offset, Take, IsDescending), IRequest<List<UserUserSearchResponseDto>>;
}
