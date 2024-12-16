using MySocailApp.Domain.UserAggregate.Entities;

namespace MySocailApp.Domain.UserAggregate.Abstracts
{
    public interface IUserReadRepository
    {
        Task<User?> GetAsync(int id, CancellationToken cancellationToken);
    }
}
