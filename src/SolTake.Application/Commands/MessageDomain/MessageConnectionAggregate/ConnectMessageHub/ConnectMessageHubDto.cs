using MediatR;

namespace MySocailApp.Application.Commands.MessageDomain.MessageConnectionAggregate.ConnectMessageHub
{
    public record ConnectMessageHubDto(string ConnectionId) : IRequest;
}
