using MySocailApp.Domain.UserDomain.UserAggregate.Entities;
using MySocailApp.Domain.UserDomain.UserAggregate.ValueObjects;

namespace MySocailApp.Domain.UserDomain.UserAggregate.Abstracts
{
    public interface IUserReadRepository
    {
        Task<User?> GetByIdAsync(int accountId, CancellationToken cancellationToken);
        Task<User?> GetByUserName(UserName userName, CancellationToken cancellationToken);
        Task<List<int>> GetUserIdsByUserNames(IEnumerable<string> userNames, CancellationToken cancellationToken);
        Task<bool> IsEmailVerified(int accountId, CancellationToken cancellationToken);
        Task<bool> EmailExist(Email email, CancellationToken cancellationToken);
        Task<bool> UserNameExist(UserName userName, CancellationToken cancellationToken);
        Task<bool> Exist(int accountId, CancellationToken cancellationToken);
    }
}
