using MediatR;

namespace MySocailApp.Application.Queries.SubjectAggregate.GetByExamId
{
    public class GetSubjectsByExamIdDto(int examId,int? offset,int take,bool isDescending) : Core.Page(offset,take,isDescending), IRequest<List<SubjectResponseDto>>
    {
        public int ExamId { get; private set; } = examId;
    }
}
