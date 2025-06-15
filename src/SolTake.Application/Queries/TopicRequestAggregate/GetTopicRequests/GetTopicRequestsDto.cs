using MediatR;
using SolTake.Core;

namespace SolTake.Application.Queries.TopicRequestAggregate.GetTopicRequests
{
    public record GetTopicRequestsDto(int? Offset, int Take, bool IsDescending) : Page(Offset, Take, IsDescending), IRequest<List<TopicRequestResponseDto>>;
}
