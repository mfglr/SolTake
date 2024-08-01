using MediatR;

namespace MySocailApp.Application.Commands.MessageAggregate.AddViewerToMessage
{
    public record AddViewerToMessageDto(int MessageId) : IRequest;
}
