using MySocailApp.Domain.AppUserAggregate;

namespace MySocailApp.Domain.AccountAggregate
{
    public interface IAppUserRepository
    {
        Task CreateAsync(AppUser user, CancellationToken cancellationToken);
    }
}
