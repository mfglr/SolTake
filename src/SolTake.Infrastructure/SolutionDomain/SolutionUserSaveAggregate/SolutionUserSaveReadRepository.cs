﻿using Microsoft.EntityFrameworkCore;
using SolTake.Domain.SolutionUserSaveAggregate.Abstracts;
using SolTake.Infrastructure.DbContexts;

namespace SolTake.Infrastructure.SolutionDomain.SolutionUserSaveAggregate
{
    internal class SolutionUserSaveReadRepository(AppDbContext context) : ISolutionUserSaveReadRepository
    {
        private readonly AppDbContext _context = context;

        public Task<bool> ExistAsync(int solutionId, int userId, CancellationToken cancellationToken)
            => _context.SolutionUserSaves.AnyAsync(x => x.SolutionId == solutionId && x.UserId == userId, cancellationToken);
    }
}
