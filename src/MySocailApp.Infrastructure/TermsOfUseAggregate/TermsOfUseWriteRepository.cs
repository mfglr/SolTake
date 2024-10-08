using MySocailApp.Domain.TermsOfUseAggregate;
using MySocailApp.Domain.TermsOfUseAggregate.Abstracts;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.TermsOfUseAggregate
{
    public class TermsOfUseWriteRepository(AppDbContext context) : ITermsOfUseWriteRepository
    {
        private readonly AppDbContext _context = context;

        public async Task CreateAsync(TermsOfUse termsOfUse, CancellationToken cancellationToken)
            => await _context.TermsOfUses.AddAsync(termsOfUse, cancellationToken);
    }
}
