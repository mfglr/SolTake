using MediatR;

namespace SolTake.Application.Commands.ExamRequestAggregate.Approve
{
    public record ApproveExamRequestDto(int Id) : IRequest;
}
