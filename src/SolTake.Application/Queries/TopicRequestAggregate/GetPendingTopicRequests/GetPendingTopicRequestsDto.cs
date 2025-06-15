using MediatR;
using SolTake.Core;

namespace SolTake.Application.Queries.TopicRequestAggregate.GetPendingTopicRequests
{
    public record GetPendingTopicRequestsDto(int? Offset, int Take, bool IsDescending) : Page(Offset,Take,IsDescending), IRequest<List<TopicRequestResponseDto>>;
}
