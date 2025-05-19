using MySocailApp.Domain.UserAggregate.Entities;
using MySocailApp.Domain.UserAggregate.ValueObjects;

namespace MySocailApp.Domain.UserAggregate.Abstracts
{
    public interface IUserReadRepository
    {
        Task<User?> GetByIdAsync(int id, CancellationToken cancellationToken);
        Task<User?> GetByUserName(UserName userName, CancellationToken cancellationToken);
        Task<List<int>> GetUserIdsByUserNames(IEnumerable<string> userNames, CancellationToken cancellationToken);
        Task<bool> IsEmailTaken(Email email, CancellationToken cancellationToken);
        Task<bool> UserNameExist(UserName userName, CancellationToken cancellationToken);
        Task<bool> Exist(int id, CancellationToken cancellationToken);
    }
}
