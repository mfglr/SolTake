using MediatR;
using MySocailApp.Core;

namespace MySocailApp.Application.Queries.MessageAggregate.GetMessagesByUserId
{
    public class GetMessagesByUserIdDto(int userId, int? offset, int take, bool isDescending) : Pagination(offset,take,isDescending), IRequest<List<MessageResponseDto>>
    {
        public int UserId { get; private set; } = userId;
    }
}
