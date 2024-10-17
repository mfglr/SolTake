using MySocailApp.Domain.AppUserAggregate.Entities;

namespace MySocailApp.Domain.AppUserAggregate.Interfaces
{
    public interface IAppUserReadRepository
    {
        Task<AppUser?> GetAsync(int id, CancellationToken cancellationToken);
    }
}
