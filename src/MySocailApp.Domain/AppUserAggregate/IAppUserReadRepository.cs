namespace MySocailApp.Domain.AppUserAggregate
{
    public interface IAppUserReadRepository
    {
        Task<AppUser?> GetByIdAsync(string id,CancellationToken cancellationToken);
        Task<List<AppUser>> SearchUser(string key, CancellationToken cancellationToken, string lastId = "");
        Task<List<AppUser>> GetFollowersByIdAsync(string id, CancellationToken cancellationToken, string lastId = "");
        Task<List<AppUser>> GetFollowedsByIdAsync(string id, CancellationToken cancellationToken, string lastId = "");
        Task<List<AppUser>> GetRequestersByIdAsync(string id, CancellationToken cancellationToken, string lastId = "");
        Task<List<AppUser>> GetRequestedsByIdAsync(string id, CancellationToken cancellationToken, string lastId = "");
    }
}
