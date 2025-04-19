using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.RoleAggregate.Abstracts;
using MySocailApp.Domain.RoleAggregate.Entities;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.RoleAggregate
{
    public class RoleReadRepository(AppDbContext context) : IRoleReadRepository
    {
        private readonly AppDbContext _context = context;

        public Task<List<Role>> GetRolesByIdsAsync(IEnumerable<int> ids, CancellationToken cancellationToken)
            => _context.Roles.Where(x =>  ids.Any(id => id == x.Id)).ToListAsync(cancellationToken);
    }
}
