using MediatR;

namespace SolTake.Application.Queries.ExamAggregate.GetExamById
{
    public record GetExamByIdDto(int ExamId) : IRequest<ExamResponseDto>;
}
