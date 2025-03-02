using MySocailApp.Domain.UserDomain.UserAggregate.Entities;
using MySocailApp.Domain.UserDomain.UserAggregate.ValueObjects;

namespace MySocailApp.Domain.UserDomain.UserAggregate.Abstracts
{
    public interface IUserWriteRepository
    {
        Task CreateAsync(User user, CancellationToken cancellationToken);
        void Delete(User user);

        Task<User?> GetByIdAsync(int id, CancellationToken cancellationToken);
        Task<User?> GetByEmailAsync(Email email, CancellationToken cancellationToken);
        Task<User?> GetByUserNameAsync(UserName userName, CancellationToken cancellationToken);
        Task<User?> GetByGoogleAccount(GoogleAccount googleAccount, CancellationToken cancellationToken);
    }
}
