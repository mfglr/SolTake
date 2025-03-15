using MediatR;

namespace MySocailApp.Application.Commands.MessageDomain.MessageAggregate.RemoveMessagesByUserIds
{
    public record RemoveMessagesByUserIdsDto(List<int> UserIds) : IRequest;
}
