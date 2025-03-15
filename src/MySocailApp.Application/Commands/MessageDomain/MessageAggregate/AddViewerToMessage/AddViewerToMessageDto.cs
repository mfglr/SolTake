using MediatR;

namespace MySocailApp.Application.Commands.MessageDomain.MessageAggregate.AddViewerToMessage
{
    public record AddViewerToMessageDto(int MessageId) : IRequest;
}
