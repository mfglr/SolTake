using MySocailApp.Domain.StoryAggregate.Entities;

namespace MySocailApp.Domain.StoryAggregate.Abstracts
{
    public interface IStoryRepository
    {
        Task CreateAsync(Story story, CancellationToken cancellationToken);
        Task CreateRangeAsync(IEnumerable<Story> stories, CancellationToken cancellationToken);
        void Delete(Story story);
        void DeleteRange(IEnumerable<Story> stories);

        Task<Story?> GetByIdAsync(int storyId, CancellationToken cancellationToken);
        Task<Story?> GetAsNoTrackingAsync(int storyId, CancellationToken cancellationToken);
        Task<List<Story>> GetByUserId(int userId, CancellationToken cancellationToken);
    }
}
