using MediatR;

namespace MySocailApp.Application.Queries.ExamAggregate.GetExamById
{
    public record GetExamByIdDto(int ExamId) : IRequest<ExamResponseDto>;
}
