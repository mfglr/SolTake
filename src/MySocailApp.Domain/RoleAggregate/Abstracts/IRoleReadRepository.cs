using MySocailApp.Domain.RoleAggregate.Entities;

namespace MySocailApp.Domain.RoleAggregate.Abstracts
{
    public interface IRoleReadRepository
    {
        Task<List<Role>> GetRolesByIdsAsync(IEnumerable<int> ids, CancellationToken cancellationToken);
    }
}
