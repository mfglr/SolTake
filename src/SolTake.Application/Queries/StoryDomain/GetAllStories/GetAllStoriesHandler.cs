using MediatR;
using SolTake.Application.InfrastructureServices;
using SolTake.Application.QueryRepositories;

namespace SolTake.Application.Queries.StoryDomain.GetAllStories
{
    public class GetAllStoriesHandler(IStoryQueryRepository storyQueryRepository, IAccessTokenReader accessTokenReader) : IRequestHandler<GetAllStoriesDto, List<StoryResponseDto>>
    {
        private readonly IStoryQueryRepository _storyQueryRepository = storyQueryRepository;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;

        public Task<List<StoryResponseDto>> Handle(GetAllStoriesDto request, CancellationToken cancellationToken)
            => _storyQueryRepository.GetAllStoriesByUserId(
                    _accessTokenReader.GetRequiredAccountId(),
                    _accessTokenReader.GetRequiredAccountId(),
                    request,
                    cancellationToken
                );
    }
}
