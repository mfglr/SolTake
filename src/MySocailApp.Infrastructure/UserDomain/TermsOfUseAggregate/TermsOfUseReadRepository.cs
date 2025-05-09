﻿using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.TermsOfUseAggregate;
using MySocailApp.Domain.TermsOfUseAggregate.Abstracts;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.UserDomain.TermsOfUseAggregate
{
    public class TermsOfUseReadRepository(AppDbContext context) : ITermsOfUseReadRepository
    {
        private readonly AppDbContext _context = context;

        public Task<TermsOfUse> GetLastTermsOfUseAsync(CancellationToken cancellationToken)
            => _context.TermsOfUses
                .AsNoTracking()
                .OrderByDescending(x => x.Id)
                .FirstAsync(cancellationToken);
    }
}
