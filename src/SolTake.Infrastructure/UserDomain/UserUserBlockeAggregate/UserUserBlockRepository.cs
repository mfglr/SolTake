﻿using Microsoft.EntityFrameworkCore;
using SolTake.Domain.UserUserBlockAggregate.Abstracts;
using SolTake.Domain.UserUserBlockAggregate.Entities;
using SolTake.Infrastructure.DbContexts;

namespace SolTake.Infrastructure.UserDomain.UserUserBlockeAggregate
{
    internal class UserUserBlockRepository(AppDbContext context) : IUserUserBlockRepository
    {
        private readonly AppDbContext _context = context;

        public async Task CreateAsync(UserUserBlock userUserblock, CancellationToken cancellationToken)
            => await _context.UserUserBlocks.AddAsync(userUserblock, cancellationToken);
        public void Delete(UserUserBlock userUserBlock)
            => _context.UserUserBlocks.Remove(userUserBlock);
        public Task<bool> ExistAsync(int blockerId, int blockedId, CancellationToken cancellationToken)
            => _context.UserUserBlocks.AnyAsync(x => x.BlockerId == blockerId && x.BlockedId == blockedId, cancellationToken);

        public Task<UserUserBlock?> GetAsync(int blockerId, int blockedId, CancellationToken cancellationToken)
            => _context.UserUserBlocks.FirstOrDefaultAsync(x => x.BlockerId == blockerId && x.BlockedId == blockedId, cancellationToken);
    }
}
