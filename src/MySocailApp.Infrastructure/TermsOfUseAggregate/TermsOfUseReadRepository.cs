using AccountDomain.TermsOfUseAggregate;
using AccountDomain.TermsOfUseAggregate.Abstracts;
using Microsoft.EntityFrameworkCore;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.TermsOfUseAggregate
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
