using MediatR;
using SolTake.Core;

namespace SolTake.Application.Queries.TopicAggregate.GetBySubjectId
{
    public record GetTopicsBySubjectIdDto(int SubjectId, int? Offset, int Take, bool IsDescending) : Page(Offset, Take, IsDescending), IRequest<List<TopicResponseDto>>;
}
