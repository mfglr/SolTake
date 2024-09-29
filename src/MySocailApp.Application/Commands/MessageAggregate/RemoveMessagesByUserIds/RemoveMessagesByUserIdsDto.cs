using MediatR;

namespace MySocailApp.Application.Commands.MessageAggregate.RemoveMessagesByUserIds
{
    public record RemoveMessagesByUserIdsDto(List<int> UserIds) : IRequest;
}
