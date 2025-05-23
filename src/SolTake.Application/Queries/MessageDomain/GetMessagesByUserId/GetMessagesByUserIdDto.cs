using MediatR;
using SolTake.Core;

namespace SolTake.Application.Queries.MessageDomain.GetMessagesByUserId
{
    public record GetMessagesByUserIdDto(int UserId, int? Offset, int Take, bool IsDescending) : Page(Offset, Take, IsDescending), IRequest<List<MessageResponseDto>>;
}
