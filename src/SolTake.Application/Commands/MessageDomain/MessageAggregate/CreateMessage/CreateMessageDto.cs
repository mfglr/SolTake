using MediatR;
using Microsoft.AspNetCore.Http;

namespace SolTake.Application.Commands.MessageDomain.MessageAggregate.CreateMessage
{
    public record CreateMessageDto(int ReceiverId, string? Content, IFormFileCollection Medias) : IRequest<CreateMessageResponseDto>;
}
