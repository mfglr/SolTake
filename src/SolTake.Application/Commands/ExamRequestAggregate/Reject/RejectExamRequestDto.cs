using MediatR;
using SolTake.Domain.ExamRequestAggregate.ValueObjects;

namespace SolTake.Application.Commands.ExamRequestAggregate.Reject
{
    public record RejectExamRequestDto(int Id, ExamRequestRejectionReason Reason) : IRequest;
}
