namespace MySocailApp.Domain.AppUserAggregate
{
    public interface IAppUserWriteRepository
    {
        Task CreateAsync(AppUser user, CancellationToken cancellationToken);
        void Delete(AppUser user);
        Task<AppUser> GetByIdAsync(int id, CancellationToken cancellationToken);
        Task<AppUser?> GetWithAllAsync(int id, int userId, CancellationToken cancellationToken);
        Task<AppUser?> GetWithAllAsync(int id, CancellationToken cancellationToken);
        Task<AppUser?> GetWithBlocker(int id, int userId, CancellationToken cancellationToken);

        Task<AppUser?> GetWithRequesterByIdAsync(int id, int requesterId, CancellationToken cancellationToken);
        Task<AppUser?> GetWithRequestedByIdAsync(int id, int requestedId, CancellationToken cancellationToken);
        Task<AppUser?> GetWithFollowerByIdAsync(int id, int followerId, CancellationToken cancellationToken);

        Task<AppUser?> GetWithFollowerRequesterBlockedBlockerByIdAsync(int id, int userId, CancellationToken cancellationToken);

        Task<AppUser?> GetWithFollowerRequesterByIdAsync(int id, int userId, CancellationToken cancellationToken);
        Task<AppUser?> GetWithFollowedRequestedByIdAsync(int id, int userId, CancellationToken cancellationToken);

        Task<AppUser?> GetWithRequestersByIdAsync(int id, CancellationToken cancellationToken);
    }
}
