using MySocailApp.Domain.AppUserAggregate.Entities;

namespace MySocailApp.Domain.AppUserAggregate.Interfaces
{
    public interface IAppUserReadRepository
    {
        Task<AppUser?> GetByIdAsync(int id, CancellationToken cancellationToken);
        Task<AppUser?> GetByUserNameAsync(string userName, CancellationToken cancellationToken);
        Task<List<AppUser>> GetByUserNames(IEnumerable<string> userNames, CancellationToken cancellationToken);
        Task<List<AppUser>> SearchUser(string key, int? lastId, int? take, CancellationToken cancellationToken);
        Task<List<AppUser>> GetFollowersByIdAsync(int id, int? lastId, int? take, CancellationToken cancellationToken);
        Task<List<AppUser>> GetFollowedsByIdAsync(int id, int? lastId, int? take, CancellationToken cancellationToken);
        Task<List<AppUser>> GetRequestersByIdAsync(int id, int? lastId, int? take, CancellationToken cancellationToken);
        Task<List<AppUser>> GetRequestedsByIdAsync(int id, int? lastId, int? take, CancellationToken cancellationToken);
    }
}
