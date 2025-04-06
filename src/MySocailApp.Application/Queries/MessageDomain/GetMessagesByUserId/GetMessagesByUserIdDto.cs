using MediatR;
using MySocailApp.Core;

namespace MySocailApp.Application.Queries.MessageDomain.GetMessagesByUserId
{
    public record GetMessagesByUserIdDto(int UserId, int? Offset, int Take, bool IsDescending) : Page(Offset, Take, IsDescending), IRequest<List<MessageResponseDto>>;
}
