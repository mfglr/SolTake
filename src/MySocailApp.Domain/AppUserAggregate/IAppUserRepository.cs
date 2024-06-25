namespace MySocailApp.Domain.AppUserAggregate
{
    public interface IAppUserRepository
    {
        Task CreateAsync(AppUser user, CancellationToken cancellationToken);
        void Delete(AppUser user);
        Task<AppUser?> GetByIdAsync(string id, CancellationToken cancellationToken);
        Task<AppUser?> GetWithAllAsync(string id, string userId, CancellationToken cancellationToken);
        Task<AppUser?> GetWithAllAsync(string id, CancellationToken cancellationToken);
        Task<AppUser?> GetWithBlocker(string id, string userId, CancellationToken cancellationToken);
        Task<AppUser?> GetWithFollowerByIdAsync(string id, string followerId, CancellationToken cancellationToken);
        Task<AppUser?> GetWithFollowerAndRequesterByIdAsync(string id, string userId, CancellationToken cancellationToken);
        Task<AppUser?> GetWithRequesterByIdAsync(string id, string requesterId, CancellationToken cancellationToken);
        Task<AppUser?> GetWithRequestersById(string id, CancellationToken cancellationToken);

        Task<AppUser?> GetByIdWithFollowersAndFolloweds(string id, CancellationToken cancellationToken);

    }
}
