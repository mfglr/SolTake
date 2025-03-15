using MediatR;
using Microsoft.AspNetCore.Http;

namespace MySocailApp.Application.Commands.MessageDomain.MessageAggregate.CreateMessage
{
    public record CreateMessageDto(int ReceiverId, string? Content, IFormFileCollection Medias) : IRequest<CreateMessageResponseDto>;
}
