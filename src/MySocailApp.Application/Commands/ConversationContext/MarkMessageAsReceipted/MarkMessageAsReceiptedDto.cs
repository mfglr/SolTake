using MediatR;

namespace MySocailApp.Application.Commands.ConversationContext.MarkMessageAsReceipted
{
    public record MarkMessageAsReceiptedDto(int MessageId) : IRequest;
}
