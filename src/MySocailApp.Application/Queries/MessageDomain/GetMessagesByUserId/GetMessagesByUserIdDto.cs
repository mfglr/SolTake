using MediatR;
using MySocailApp.Application.Queries.MessageDomain;
using MySocailApp.Core;

namespace MySocailApp.Application.Queries.MessageDomain.GetMessagesByUserId
{
    public class GetMessagesByUserIdDto(int userId, int? offset, int take, bool isDescending) : Page(offset, take, isDescending), IRequest<List<MessageResponseDto>>
    {
        public int UserId { get; private set; } = userId;
    }
}
