using MySocailApp.Domain.AppUserAggregate.Entities;

namespace MySocailApp.Domain.AppUserAggregate.Interfaces
{
    public interface IAppUserWriteRepository
    {
        Task CreateAsync(AppUser user, CancellationToken cancellationToken);
        void Delete(AppUser user);

        Task<AppUser> GetByIdAsync(int id, CancellationToken cancellationToken);
        Task<AppUser?> GetWithFollowerByIdAsync(int id, int followerId, CancellationToken cancellationToken);
        Task<AppUser?> GetWithSearchedByIdAsync(int id, int searchedId, CancellationToken cancellationToken);
        Task<AppUser?> GetWithAllAsync(int id, CancellationToken cancellationToken);
    }
}
