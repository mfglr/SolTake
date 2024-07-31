using MediatR;

namespace MySocailApp.Application.Commands.ConversationContext.ConnectMessageHub
{
    public record ConnectMessageHubDto(string ConnectionId) : IRequest;
}
