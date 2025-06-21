using SolTake.Domain.SubjectRequestAggregate.ValueObjects;

namespace SolTake.Application.Queries.SubjectRequestAggregate
{
    public record SubjectRequestResponseDto(int Id, DateTime CreatedAt, string Name, int ExamId, string ExamName, SubjectRequestState State, SubjectRequestRejectionReason? Reason);
}
