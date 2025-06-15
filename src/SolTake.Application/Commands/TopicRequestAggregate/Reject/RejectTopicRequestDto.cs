using MediatR;
using SolTake.Domain.TopicRequestAggregate.ValueObjects;

namespace SolTake.Application.Commands.TopicRequestAggregate.Reject
{
    public record RejectTopicRequestDto(int Id, RejectionReason Reason) : IRequest;
}
