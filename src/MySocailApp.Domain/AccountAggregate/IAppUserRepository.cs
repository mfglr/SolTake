using MySocailApp.Domain.AppUserAggregate;

namespace MySocailApp.Domain.AccountAggregate
{
    public interface IAppUserRepository
    {
        Task CreateAsync(AppUser user, CancellationToken cancellationToken);
        Task<AppUser> GetByIdAsync(int id,CancellationToken cancellationToken);
        Task<AppUser> GetWithAllAsync(int id,CancellationToken cancellationToken);
    }
}
