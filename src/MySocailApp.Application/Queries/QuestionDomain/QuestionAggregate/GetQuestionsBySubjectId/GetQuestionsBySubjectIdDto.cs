using MediatR;
using MySocailApp.Core;

namespace MySocailApp.Application.Queries.QuestionDomain.QuestionAggregate.GetQuestionsBySubjectId
{
    public class GetQuestionsBySubjectIdDto(int subjectId, int? offset, int take, bool isDescending) : Page(offset, take, isDescending), IRequest<List<QuestionResponseDto>>
    {
        public int SubjectId { get; set; } = subjectId;
    }
}
