using MediatR;
using SolTake.Application.InfrastructureServices;
using SolTake.Application.QueryRepositories;

namespace MySocailApp.Application.Queries.StoryDomain.GetStories
{
    public class GetStoriesHandler(IAccessTokenReader accessTokenReader, IStoryQueryRepository storyQueryRepository) : IRequestHandler<GetStoriesDto, List<StoryResponseDto>>
    {
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly IStoryQueryRepository _storyQueryRepository = storyQueryRepository;

        public Task<List<StoryResponseDto>> Handle(GetStoriesDto request, CancellationToken cancellationToken)
            => _storyQueryRepository.GetStoriesByUserId(
                    _accessTokenReader.GetRequiredAccountId(),
                    _accessTokenReader.GetRequiredAccountId(),
                    cancellationToken
                );
    }
}
