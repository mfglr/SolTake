using MediatR;

namespace MySocailApp.Application.Queries.QuestionAggregate.GetQuestionsByExamId
{
    public record GetQuestionsByExamIdDto(int ExamId, int? LastValue, int? Take) : IRequest<List<QuestionResponseDto>>;
}
