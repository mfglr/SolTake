using MediatR;
using SolTake.Application.InfrastructureServices;
using SolTake.Application.QueryRepositories;

namespace SolTake.Application.Queries.TopicRequestAggregate.GetTopicRequests
{
    public class GetTopicRequestsHandler(ITopicRequestQueryRepository topicRequestQueryRepository, IAccessTokenReader accessTokenReader) : IRequestHandler<GetTopicRequestsDto, List<TopicRequestResponseDto>>
    {
        private readonly ITopicRequestQueryRepository _topicRequestQueryRepository = topicRequestQueryRepository;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;

        public Task<List<TopicRequestResponseDto>> Handle(GetTopicRequestsDto request, CancellationToken cancellationToken)
            => _topicRequestQueryRepository.GetTopicRequestsByUserIdAsync(_accessTokenReader.GetRequiredAccountId(), request, cancellationToken);
    }
}
