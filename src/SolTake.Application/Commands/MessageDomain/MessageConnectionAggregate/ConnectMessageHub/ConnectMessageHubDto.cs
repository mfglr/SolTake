using MediatR;

namespace SolTake.Application.Commands.MessageDomain.MessageConnectionAggregate.ConnectMessageHub
{
    public record ConnectMessageHubDto(string ConnectionId) : IRequest;
}
