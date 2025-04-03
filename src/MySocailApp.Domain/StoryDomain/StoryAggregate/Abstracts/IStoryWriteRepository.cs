using MySocailApp.Domain.StoryDomain.StoryAggregate.Entities;

namespace MySocailApp.Domain.StoryDomain.StoryAggregate.Abstracts
{
    public interface IStoryWriteRepository
    {
        Task CreateAsync(Story story, CancellationToken cancellationToken);
        Task CreateRangeAsync(IEnumerable<Story> stories, CancellationToken cancellationToken);
        void Delete(Story story);
        void DeleteRange(IEnumerable<Story> stories);

        Task<Story?> GetByIdAsync(int storyId, CancellationToken cancellationToken);
        Task<List<Story>> GetByUserId(int userId,CancellationToken cancellationToken);
    }
}
