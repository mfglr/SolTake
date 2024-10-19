using MySocailApp.Domain.AppUserAggregate.Entities;

namespace MySocailApp.Domain.AppUserAggregate.Abstracts
{
    public interface IAppUserReadRepository
    {
        Task<AppUser?> GetAsync(int id, CancellationToken cancellationToken);
    }
}
