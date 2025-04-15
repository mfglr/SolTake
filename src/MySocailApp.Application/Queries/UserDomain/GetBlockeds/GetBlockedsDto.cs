using MediatR;
using MySocailApp.Core;

namespace MySocailApp.Application.Queries.UserDomain.GetBlockeds
{
    public record GetBlockedsDto(int? Offset,int Take, bool IsDescending) : Page(Offset,Take,IsDescending), IRequest<List<UserUserBlockResponseDto>>;
}
