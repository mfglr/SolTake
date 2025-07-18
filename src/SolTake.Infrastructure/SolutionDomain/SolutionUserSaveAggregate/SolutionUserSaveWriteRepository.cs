﻿using Microsoft.EntityFrameworkCore;
using SolTake.Domain.SolutionUserSaveAggregate.Abstracts;
using SolTake.Domain.SolutionUserSaveAggregate.Entities;
using SolTake.Infrastructure.DbContexts;

namespace SolTake.Infrastructure.SolutionDomain.SolutionUserSaveAggregate
{
    internal class SolutionUserSaveWriteRepository(AppDbContext context) : ISolutionUserSaveWriteRepository
    {
        private readonly AppDbContext _context = context;

        public async Task CreateAsync(SolutionUserSave solutionUserSave, CancellationToken cancellationToken)
            => await _context.AddAsync(solutionUserSave, cancellationToken);
        public void Delete(SolutionUserSave solutionUserSave)
            => _context.Remove(solutionUserSave);
        public void DeleteRange(IEnumerable<SolutionUserSave> solutionUserSaves)
            => _context.RemoveRange(solutionUserSaves);
        
        public Task<SolutionUserSave?> GetAsync(int solutionId, int userId, CancellationToken cancellationToken)
            => _context.SolutionUserSaves.FirstOrDefaultAsync(x => x.SolutionId == solutionId && x.UserId == userId,cancellationToken);

        public Task<List<SolutionUserSave>> GetAsync(IEnumerable<int> solutionIds, int userId, CancellationToken cancellationToken)
            => _context.SolutionUserSaves
                .Where(x => solutionIds.Contains(x.SolutionId) && x.UserId == userId)
                .ToListAsync(cancellationToken);

        public Task<List<SolutionUserSave>> GetByUserId(int userId, CancellationToken cancellationToken)
            => _context.SolutionUserSaves.Where(x => x.UserId == userId).ToListAsync(cancellationToken);
    }
}
