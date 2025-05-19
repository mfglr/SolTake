using MySocailApp.Domain.UserUserFollowAggregate.Entities;

namespace MySocailApp.Domain.UserUserFollowAggregate.Abstracts
{
    public interface IUserUserFollowWriteRepository
    {
        Task<UserUserFollow?> GetAsync(int followerId, int followedId, CancellationToken cancellationToken);
        Task<List<UserUserFollow>> GetByUserIdAsync(int userId, CancellationToken cancellationToken);
        Task CreateAsync(UserUserFollow follow, CancellationToken cancellationToken);
        void Delete(UserUserFollow follow);
        void DeleteRange(IEnumerable<UserUserFollow> follows);

        Task<List<UserUserFollow>> GetListAsync(int userId0, int userId1, CancellationToken cancellationToken);
    }
}
