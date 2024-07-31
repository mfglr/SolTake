using MediatR;

namespace MySocailApp.Application.Commands.ConversationContext.MarkMessagesAsReceipted
{
    public record MarkMessagesAsReceiptedDto(List<int> Ids) : IRequest;
}
