using MediatR;
using SolTake.Core;

namespace SolTake.Application.Queries.TopicRequestAggregate.GetAllTopicRequests
{
    public record GetAllTopicRequestsDto(int? Offset, int Take, bool IsDescending) : Page(Offset,Take, IsDescending), IRequest<List<TopicRequestResponseDto>>;
}
