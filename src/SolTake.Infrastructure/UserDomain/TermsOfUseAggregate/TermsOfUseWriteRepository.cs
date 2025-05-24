using SolTake.Domain.TermsOfUseAggregate;
using SolTake.Domain.TermsOfUseAggregate.Abstracts;
using SolTake.Infrastructure.DbContexts;

namespace SolTake.Infrastructure.UserDomain.TermsOfUseAggregate
{
    public class TermsOfUseWriteRepository(AppDbContext context) : ITermsOfUseWriteRepository
    {
        private readonly AppDbContext _context = context;

        public async Task CreateAsync(TermsOfUse termsOfUse, CancellationToken cancellationToken)
            => await _context.TermsOfUses.AddAsync(termsOfUse, cancellationToken);
    }
}
