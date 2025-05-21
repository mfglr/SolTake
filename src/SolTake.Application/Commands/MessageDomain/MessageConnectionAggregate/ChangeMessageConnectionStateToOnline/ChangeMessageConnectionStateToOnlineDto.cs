using MediatR;

namespace SolTake.Application.Commands.MessageDomain.MessageConnectionAggregate.ChangeMessageConnectionStateToOnline
{
    public record ChangeMessageConnectionStateToOnlineDto : IRequest;
}
