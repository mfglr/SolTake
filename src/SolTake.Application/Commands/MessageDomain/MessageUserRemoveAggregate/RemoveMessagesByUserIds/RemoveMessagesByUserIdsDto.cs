using MediatR;

namespace MySocailApp.Application.Commands.MessageDomain.MessageUserRemoveAggregate.RemoveMessagesByUserIds
{
    public record RemoveMessagesByUserIdsDto(List<int> UserIds) : IRequest;
}
