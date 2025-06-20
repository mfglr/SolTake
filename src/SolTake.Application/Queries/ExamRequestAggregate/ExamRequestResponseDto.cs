using SolTake.Domain.ExamRequestAggregate.ValueObjects;

namespace SolTake.Application.Queries.ExamRequestAggregate
{
    public record ExamRequestResponseDto(int Id, DateTime CreatedAt, string Name, string Initialism, ExamRequestState State, ExamRequestRejectionReason? Reason);
}
