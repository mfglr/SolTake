using MediatR;
using Microsoft.AspNetCore.Http;
using MySocailApp.Application.Queries.MessageAggregate;

namespace MySocailApp.Application.Commands.MessageAggregate.CreateMessage
{
    public record CreateMessageDto(int ReceiverId, string? Content, IFormFileCollection Medias) : IRequest<MessageResponseDto>;
}
