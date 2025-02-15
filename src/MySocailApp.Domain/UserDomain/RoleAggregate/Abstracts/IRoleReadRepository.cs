using MySocailApp.Domain.UserDomain.RoleAggregate.Entities;

namespace MySocailApp.Domain.UserDomain.RoleAggregate.Abstracts
{
    public interface IRoleReadRepository
    {
        Task<List<Role>> GetRolesByIdsAsync(IEnumerable<int> ids, CancellationToken cancellationToken);
    }
}
