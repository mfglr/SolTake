using MediatR;

namespace MySocailApp.Application.Queries.TopicAggregate.GetBySubjectId
{
    public record GetTopicsBySubjectIdDto(int SubjectId) : IRequest<List<TopicResponseDto>>;
}
