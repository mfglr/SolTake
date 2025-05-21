using MediatR;

namespace SolTake.Application.Commands.MessageDomain.MessageUserRemoveAggregate.RemoveMessagesByUserIds
{
    public record RemoveMessagesByUserIdsDto(List<int> UserIds) : IRequest;
}
