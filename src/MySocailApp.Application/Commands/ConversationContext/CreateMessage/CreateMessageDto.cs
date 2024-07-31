using MediatR;
using Microsoft.AspNetCore.Http;
using MySocailApp.Application.Queries.ConversationContenxt.MessageAggregate;

namespace MySocailApp.Application.Commands.ConversationContext.CreateMessage
{
    public record CreateMessageDto(int ReceiverId, string? Content,IFormFileCollection Images) : IRequest<MessageResponseDto>;
}
