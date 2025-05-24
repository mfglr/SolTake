using MediatR;
using SolTake.Core;

namespace SolTake.Application.Queries.UserDomain.GetUsersSearched
{
    public record GetUsersSearchedDto(int? Offset, int Take, bool IsDescending) : Page(Offset, Take, IsDescending), IRequest<List<UserUserSearchResponseDto>>;
}
