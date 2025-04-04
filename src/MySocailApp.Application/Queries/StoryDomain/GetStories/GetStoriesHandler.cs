using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Application.QueryRepositories;

namespace MySocailApp.Application.Queries.StoryDomain.GetStories
{
    public class GetStoriesHandler(IStoryQueryRepository storyQueryRepository, IAccessTokenReader accessTokenReader) : IRequestHandler<GetStoriesDto, List<StoryResponseDto>>
    {
        private readonly IStoryQueryRepository _storyQueryRepository = storyQueryRepository;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;

        public Task<List<StoryResponseDto>> Handle(GetStoriesDto request, CancellationToken cancellationToken)
            => _storyQueryRepository.GetStoriesByUserId(_accessTokenReader.GetRequiredAccountId(), request, cancellationToken);
    }
}
