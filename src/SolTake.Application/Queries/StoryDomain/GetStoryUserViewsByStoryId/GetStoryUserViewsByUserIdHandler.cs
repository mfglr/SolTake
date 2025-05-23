using MediatR;
using SolTake.Application.QueryRepositories;

namespace MySocailApp.Application.Queries.StoryDomain.GetStoryUserViewsByStoryId
{
    public class GetStoryUserViewsByUserIdHandler(IStoryUserViewQueryRepository storyUserViewQueryRepository) : IRequestHandler<GetStoryUserViewsByStoryIdDto, List<StoryUserViewResponseDto>>
    {
        private readonly IStoryUserViewQueryRepository _storyUserViewQueryRepository = storyUserViewQueryRepository;

        public Task<List<StoryUserViewResponseDto>> Handle(GetStoryUserViewsByStoryIdDto request, CancellationToken cancellationToken)
            => _storyUserViewQueryRepository.GetStoryUserViewsByStoryId(request.StoryId,request,cancellationToken);
    }
}
