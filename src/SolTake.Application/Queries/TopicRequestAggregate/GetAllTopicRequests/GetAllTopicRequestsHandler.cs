using MediatR;
using SolTake.Application.QueryRepositories;

namespace SolTake.Application.Queries.TopicRequestAggregate.GetAllTopicRequests
{
    public class GetAllTopicRequestsHandler(ITopicRequestQueryRepository topicRequestQueryRepository) : IRequestHandler<GetAllTopicRequestsDto, List<TopicRequestResponseDto>>
    {
        private readonly ITopicRequestQueryRepository _topicRequestQueryRepository = topicRequestQueryRepository;

        public Task<List<TopicRequestResponseDto>> Handle(GetAllTopicRequestsDto request, CancellationToken cancellationToken)
            => _topicRequestQueryRepository.GetAllTopicRequestsAsync(request, cancellationToken);
    }
}
