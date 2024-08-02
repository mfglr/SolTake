using MediatR;

namespace MySocailApp.Application.Queries.ConversationAggregate.GetConversations
{
    public record GetConversationsDto(DateTime? LastValue, int? Take, int? TakeMessage) : IRequest<List<ConversationResponseDto>>;
}
