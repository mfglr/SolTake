using MySocailApp.Domain.StoryDomain.StoryAggregate.Abstracts;
using MySocailApp.Domain.StoryDomain.StoryAggregate.Exceptions;
using MySocailApp.Domain.StoryDomain.StoryUserViewAggregate.Absracts;
using MySocailApp.Domain.StoryDomain.StoryUserViewAggregate.Entities;
using MySocailApp.Domain.StoryDomain.StoryUserViewAggregate.Exceptions;

namespace MySocailApp.Domain.StoryDomain.StoryUserViewAggregate.DomainServices
{
    public class StoryUserViewCreatorDomainService(IStoryRepository storyRepository, IStoryUserViewRepository storyUserViewRepository)
    {
        private readonly IStoryRepository _storyRepository = storyRepository;
        private readonly IStoryUserViewRepository _storyUserViewRepository = storyUserViewRepository;

        public async Task CreateAsync(StoryUserView storyUserView, CancellationToken cancellationToken)
        {
            var story =
                await _storyRepository.GetAsNoTrackingAsync(storyUserView.StoryId, cancellationToken) ??
                throw new StoryNotFoundException();

            if (await _storyUserViewRepository.ExistAsync(storyUserView.StoryId, storyUserView.UserId, cancellationToken))
                throw new StoryUserViewAlreadyExistException();

            story.Create();
        }
    }
}
