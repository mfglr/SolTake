﻿using Microsoft.EntityFrameworkCore;
using SolTake.Domain.TermsOfUseAggregate;
using SolTake.Domain.TermsOfUseAggregate.Abstracts;
using SolTake.Infrastructure.DbContexts;

namespace SolTake.Infrastructure.UserDomain.TermsOfUseAggregate
{
    internal class TermsOfUseReadRepository(AppDbContext context) : ITermsOfUseReadRepository
    {
        private readonly AppDbContext _context = context;

        public Task<TermsOfUse> GetLastTermsOfUseAsync(CancellationToken cancellationToken)
            => _context.TermsOfUses
                .AsNoTracking()
                .OrderByDescending(x => x.Id)
                .FirstAsync(cancellationToken);
    }
}
