using MediatR;
using SolTake.Core;

namespace MySocailApp.Application.Queries.QuestionDomain.SearchQuestions
{
    public record SearchQuestionsDto(int? ExamId, int? SubjectId, int? TopicId, int? Offset, int Take, bool IsDescending) : Page(Offset, Take, IsDescending), IRequest<List<QuestionResponseDto>>;
}
