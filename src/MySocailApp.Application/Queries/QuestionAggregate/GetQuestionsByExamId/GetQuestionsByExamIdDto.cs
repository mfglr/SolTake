using MediatR;

namespace MySocailApp.Application.Queries.QuestionAggregate.GetQuestionsByExamId
{
    public record GetQuestionsByExamIdDto(int ExamId, int? LastValue) : IRequest<List<QuestionResponseDto>>;
}
