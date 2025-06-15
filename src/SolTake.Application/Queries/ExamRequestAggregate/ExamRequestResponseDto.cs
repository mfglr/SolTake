using SolTake.Domain.ExamRequestAggregate.ValueObjects;

namespace SolTake.Application.Queries.ExamRequestAggregate
{
    public record ExamRequestResponseDto(int Id, string Name, string Initialism, ExamRequestState State);
}
