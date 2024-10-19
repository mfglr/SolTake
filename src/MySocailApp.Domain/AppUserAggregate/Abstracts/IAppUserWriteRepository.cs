using MySocailApp.Domain.AppUserAggregate.Entities;

namespace MySocailApp.Domain.AppUserAggregate.Abstracts
{
    public interface IAppUserWriteRepository
    {
        Task CreateAsync(AppUser user, CancellationToken cancellationToken);
        void Delete(AppUser user);

        Task<AppUser> GetByIdAsync(int id, CancellationToken cancellationToken);
        Task<AppUser?> GetWithFollowerByIdAsync(int id, int followerId, CancellationToken cancellationToken);
        Task<AppUser?> GetWithSearcherByIdAsync(int id, int searcherId, CancellationToken cancellationToken);

        Task DeleteFollowsByUserId(int userId, CancellationToken cancellationToken);
        Task DeleteFollowNotificationsByUserId(int userId,CancellationToken cancellationToken);
        Task DeleteUserSerchsByUserId(int userId, CancellationToken cancellationToken);
    }
}
