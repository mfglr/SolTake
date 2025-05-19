using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Application.QueryRepositories;

namespace MySocailApp.Application.Queries.StoryDomain.GetActiveStoriesByUserId
{
    public class GetActiveStoriesByUserIdHandler(IStoryQueryRepository storyQueryRepository, IAccessTokenReader accessTokenReader) : IRequestHandler<GetActiveStoriesByUserIdDto, List<StoryResponseDto>>
    {
        private readonly IStoryQueryRepository _storyQueryRepository = storyQueryRepository;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;

        public Task<List<StoryResponseDto>> Handle(GetActiveStoriesByUserIdDto request, CancellationToken cancellationToken)
            => _storyQueryRepository.GetActiveStoriesByUserId(request.UserId, _accessTokenReader.GetAccountId(), cancellationToken);
    }
}
