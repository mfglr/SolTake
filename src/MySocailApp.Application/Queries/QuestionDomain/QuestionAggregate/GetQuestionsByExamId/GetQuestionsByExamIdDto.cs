using MediatR;
using MySocailApp.Core;

namespace MySocailApp.Application.Queries.QuestionDomain.QuestionAggregate.GetQuestionsByExamId
{
    public class GetQuestionsByExamIdDto(int examId, int? offset, int take, bool isDescending) : Page(offset, take, isDescending), IRequest<List<QuestionResponseDto>>
    {
        public int ExamId { get; set; } = examId;
    }
}
