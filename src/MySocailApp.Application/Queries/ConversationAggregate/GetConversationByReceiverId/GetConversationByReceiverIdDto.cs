using MediatR;

namespace MySocailApp.Application.Queries.ConversationAggregate.GetConversationByReceiverId
{
    public record GetConversationByReceiverIdDto(int ReceiverId,int? TakeMessage) : IRequest<ConversationResponseDto>;
}
