using MediatR;
using SolTake.Application.QueryRepositories;

namespace SolTake.Application.Queries.TopicRequestAggregate.GetPendingTopicRequests
{
    public class GetPendingTopicRequestsHandler(ITopicRequestQueryRepository topicRequestQueryRepository) : IRequestHandler<GetPendingTopicRequestsDto, List<TopicRequestResponseDto>>
    {
        private readonly ITopicRequestQueryRepository _topicRequestQueryRepository = topicRequestQueryRepository;

        public Task<List<TopicRequestResponseDto>> Handle(GetPendingTopicRequestsDto request, CancellationToken cancellationToken)
            => _topicRequestQueryRepository.GetPendingRequestsAsync(request, cancellationToken);
    }
}
