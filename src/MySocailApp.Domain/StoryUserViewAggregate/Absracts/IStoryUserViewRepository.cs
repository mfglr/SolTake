using MySocailApp.Domain.StoryUserViewAggregate.Entities;

namespace MySocailApp.Domain.StoryUserViewAggregate.Absracts
{
    public interface IStoryUserViewRepository
    {
        Task<List<StoryUserView>> GetByUserId(int userId, CancellationToken cancellationToken);
        Task<List<StoryUserView>> GetByStoryId(int storyId, CancellationToken cancellationToken);
        Task<bool> ExistAsync(int storyId, int userId, CancellationToken cancellationToken);

        Task CreateAsync(StoryUserView storyUserView, CancellationToken cancellationToken);
        void Delete(StoryUserView storyUserView);
        void DeleteRange(IEnumerable<StoryUserView> storyUserViews);
    }
}
