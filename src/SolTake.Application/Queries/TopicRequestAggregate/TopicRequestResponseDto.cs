using SolTake.Domain.TopicRequestAggregate.ValueObjects;

namespace SolTake.Application.Queries.TopicRequestAggregate
{
    public record TopicRequestResponseDto(int Id, DateTime CreatedAt, string SubjectName, string Name, TopicRequestState State, TopicRequestRejectionReason? Reason);
}
