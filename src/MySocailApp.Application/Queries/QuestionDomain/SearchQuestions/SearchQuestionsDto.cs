using MediatR;
using MySocailApp.Core;

namespace MySocailApp.Application.Queries.QuestionDomain.SearchQuestions
{
    public class SearchQuestionsDto(int? examId, int? subjectId, int? topicId, int? offset, int take, bool isDescending) : Page(offset, take, isDescending), IRequest<List<QuestionResponseDto>>
    {
        public int? ExamId { get; private set; } = examId;
        public int? SubjectId { get; private set; } = subjectId;
        public int? TopicId { get; private set; } = topicId;
    }
}
