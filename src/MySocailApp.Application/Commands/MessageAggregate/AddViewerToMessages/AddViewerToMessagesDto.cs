using MediatR;

namespace MySocailApp.Application.Commands.MessageAggregate.AddViewerToMessages
{
    public record AddViewerToMessagesDto(List<int> Ids) : IRequest;
}
