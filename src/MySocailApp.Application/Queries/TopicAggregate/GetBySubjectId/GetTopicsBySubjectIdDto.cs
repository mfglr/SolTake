using MediatR;

namespace MySocailApp.Application.Queries.TopicAggregate.GetBySubjectId
{
    public class GetTopicsBySubjectIdDto(int subjectId,int? offset,int take,bool isDescending) : Core.Page(offset,take,isDescending), IRequest<List<TopicResponseDto>>
    {
        public int SubjectId { get; private set; } = subjectId;
    }
}
