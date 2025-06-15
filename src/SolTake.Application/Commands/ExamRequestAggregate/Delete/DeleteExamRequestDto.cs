using MediatR;

namespace SolTake.Application.Commands.ExamRequestAggregate.Delete
{
    public record DeleteExamRequestDto(int Id) : IRequest;
}
