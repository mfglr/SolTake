using MediatR;
using MySocailApp.Core;

namespace MySocailApp.Application.Queries.QuestionAggregate.SearchQuestions
{
    public class SearchQuestionsDto(string? key,int? examId,int? subjectId,int? topicId,int? offset,int take,bool isDescending) : Page(offset,take,isDescending), IRequest<List<QuestionResponseDto>>
    {
        public string? Key { get; private set; } = key;
        public int? ExamId { get; private set; } = examId;
        public int? SubjectId { get; private set; } = subjectId;
        public int? TopicId { get; private set; } = topicId;
    }
}
