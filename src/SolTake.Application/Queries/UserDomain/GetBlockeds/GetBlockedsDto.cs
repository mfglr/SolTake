using MediatR;
using SolTake.Core;

namespace SolTake.Application.Queries.UserDomain.GetBlockeds
{
    public record GetBlockedsDto(int? Offset,int Take, bool IsDescending) : Page(Offset,Take,IsDescending), IRequest<List<UserUserBlockResponseDto>>;
}
