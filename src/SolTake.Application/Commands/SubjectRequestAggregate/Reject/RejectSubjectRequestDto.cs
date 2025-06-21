using MediatR;
using SolTake.Domain.SubjectRequestAggregate.ValueObjects;

namespace SolTake.Application.Commands.SubjectRequestAggregate.Reject
{
    public record RejectSubjectRequestDto(int Id, SubjectRequestRejectionReason Reason) : IRequest;
}
