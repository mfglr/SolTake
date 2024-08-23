using MySocailApp.Core;
using MySocailApp.Domain.AppUserAggregate.Entities;

namespace MySocailApp.Domain.AppUserAggregate.Interfaces
{
    public interface IAppUserReadRepository
    {
        Task<AppUser?> GetAsync(int id, CancellationToken cancellationToken);
        Task<AppUser?> GetByIdAsync(int id, CancellationToken cancellationToken);
        Task<AppUser?> GetByUserNameAsync(string userName, CancellationToken cancellationToken);
        Task<List<int>> GetIdsByUserNames(IEnumerable<string> userNames, CancellationToken cancellationToken);
        
        Task<List<AppUser>> GetFollowersByIdAsync(int id, IPagination pagination, CancellationToken cancellationToken);
        Task<List<AppUser>> SearchUser(string key, IPagination pagination, CancellationToken cancellationToken);
        Task<List<AppUser>> GetFollowedsByIdAsync(int id, IPagination pagination, CancellationToken cancellationToken);
        Task<List<AppUser>> GetNotFollowedsByIdAsync(int id, IPagination pagination, CancellationToken cancellationToken);
        
        Task<List<AppUser>> GetSearchedUsersByIdAsync(int id, int? offset, int take, CancellationToken cancellationToken);
    }
}
