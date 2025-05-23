using MediatR;
using SolTake.Application.QueryRepositories;

namespace MySocailApp.Application.Queries.TopicAggregate.GetBySubjectId
{
    public class GetTopicsBySubjectIdHandler(ITopicQueryRepository topicQueryRepository) : IRequestHandler<GetTopicsBySubjectIdDto, List<TopicResponseDto>>
    {
        private readonly ITopicQueryRepository _topicQueryRepository = topicQueryRepository;

        public Task<List<TopicResponseDto>> Handle(GetTopicsBySubjectIdDto request, CancellationToken cancellationToken)
            => _topicQueryRepository.GetSubjectTopicsAsync(request.SubjectId, request, cancellationToken);
    }
}
