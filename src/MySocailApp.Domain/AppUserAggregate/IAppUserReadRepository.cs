namespace MySocailApp.Domain.AppUserAggregate
{
    public interface IAppUserReadRepository
    {
        Task<AppUser?> GetByIdAsync(int id,CancellationToken cancellationToken);
        Task<AppUser?> GetByUserNameAsync(string userName,CancellationToken cancellationToken);
        Task<List<AppUser>> SearchUser(string key, int? lastId, CancellationToken cancellationToken);
        Task<List<AppUser>> GetFollowersByIdAsync(int id, int? lastId, CancellationToken cancellationToken);
        Task<List<AppUser>> GetFollowedsByIdAsync(int id, int? lastId, CancellationToken cancellationToken);
        Task<List<AppUser>> GetRequestersByIdAsync(int id, int? lastId, CancellationToken cancellationToken);
        Task<List<AppUser>> GetRequestedsByIdAsync(int id, int? lastId, CancellationToken cancellationToken);
    }
}
