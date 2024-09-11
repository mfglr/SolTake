using MediatR;

namespace MySocailApp.Application.Commands.MessageAggregate.RemoveMessage
{
    public record RemoveMessageDto(int MessageId) : IRequest;
}
