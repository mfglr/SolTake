namespace MySocailApp.Domain.AppUserAggregate
{
    public interface IAppUserWriteRepository
    {
        Task CreateAsync(AppUser user, CancellationToken cancellationToken);
        void Delete(AppUser user);
        Task<AppUser> GetByIdAsync(string id, CancellationToken cancellationToken);
        Task<AppUser?> GetWithAllAsync(string id, string userId, CancellationToken cancellationToken);
        Task<AppUser?> GetWithAllAsync(string id, CancellationToken cancellationToken);
        Task<AppUser?> GetWithBlocker(string id, string userId, CancellationToken cancellationToken);

        Task<AppUser?> GetWithRequesterByIdAsync(string id, string requesterId, CancellationToken cancellationToken);
        Task<AppUser?> GetWithRequestedByIdAsync(string id, string requestedId, CancellationToken cancellationToken);
        Task<AppUser?> GetWithFollowerByIdAsync(string id, string followerId, CancellationToken cancellationToken);

        Task<AppUser?> GetWithFollowerRequesterBlockedBlockerByIdAsync(string id, string userId, CancellationToken cancellationToken);

        Task<AppUser?> GetWithFollowerRequesterByIdAsync(string id, string userId, CancellationToken cancellationToken);
        Task<AppUser?> GetWithFollowedRequestedByIdAsync(string id, string userId, CancellationToken cancellationToken);

        Task<AppUser?> GetWithRequestersByIdAsync(string id, CancellationToken cancellationToken);
    }
}
