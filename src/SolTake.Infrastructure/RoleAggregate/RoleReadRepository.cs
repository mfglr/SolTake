﻿using Microsoft.EntityFrameworkCore;
using SolTake.Domain.RoleAggregate.Abstracts;
using SolTake.Domain.RoleAggregate.Entities;
using SolTake.Infrastructure.DbContexts;

namespace SolTake.Infrastructure.RoleAggregate
{
    internal class RoleReadRepository(AppDbContext context) : IRoleReadRepository
    {
        private readonly AppDbContext _context = context;

        public Task<List<Role>> GetRolesByIdsAsync(IEnumerable<int> ids, CancellationToken cancellationToken)
            => _context.Roles.Where(x =>  ids.Any(id => id == x.Id)).ToListAsync(cancellationToken);
    }
}
