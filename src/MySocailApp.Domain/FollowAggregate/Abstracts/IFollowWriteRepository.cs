using MySocailApp.Domain.FollowAggregate.Entities;

namespace MySocailApp.Domain.FollowAggregate.Abstracts
{
    public interface IFollowWriteRepository
    {
        Task<Follow?> GetAsync(int followerId, int followedId, CancellationToken cancellationToken);
        Task<List<Follow>> GetByUserIdAsync(int userId, CancellationToken cancellationToken);
        Task CreateAsync(Follow follow, CancellationToken cancellationToken);
        void Delete(Follow follow);
        void DeleteRange(IEnumerable<Follow> follows);
    }
}
