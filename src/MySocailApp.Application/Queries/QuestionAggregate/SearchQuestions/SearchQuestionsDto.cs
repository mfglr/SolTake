using MediatR;

namespace MySocailApp.Application.Queries.QuestionAggregate.SearchQuestions
{
    public record SearchQuestionsDto(string? Key,int? ExamId,int? SubjectId,int? TopicId,int? LastValue,int? Take) : IRequest<List<QuestionResponseDto>>;
}
