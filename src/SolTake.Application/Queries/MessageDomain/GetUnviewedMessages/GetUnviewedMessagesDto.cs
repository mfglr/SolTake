using MediatR;

namespace SolTake.Application.Queries.MessageDomain.GetUnviewedMessages
{
    public record GetUnviewedMessagesDto() : IRequest<List<MessageResponseDto>>;
}
