using MySocailApp.Domain.StoryAggregate.Exceptions;
using MySocailApp.Domain.StoryUserViewAggregate.Exceptions;
using MySocailApp.Domain.StoryUserViewAggregate.Absracts;
using MySocailApp.Domain.StoryUserViewAggregate.Entities;
using MySocailApp.Domain.StoryAggregate.Abstracts;

namespace MySocailApp.Domain.StoryUserViewAggregate.DomainServices
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

            storyUserView.Create();
        }
    }
}
