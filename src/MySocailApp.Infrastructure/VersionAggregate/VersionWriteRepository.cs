using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.VersionAggregate.Abstracts;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.VersionAggregate
{
    public class VersionWriteRepository(AppDbContext context) : IVersionWriteRepository
    {
        private readonly AppDbContext _context = context;

        public Task<Domain.VersionAggregate.Entities.Version> GetLastVersionAsync(CancellationToken cancellationToken)
            => _context.Versions.OrderByDescending(x => x.Id).FirstAsync(cancellationToken);

        public async Task CreateAsync(Domain.VersionAggregate.Entities.Version version, CancellationToken cancellationToken)
            => await _context.AddAsync(version, cancellationToken);

        public void Delete(Domain.VersionAggregate.Entities.Version version)
            => _context.Versions.Remove(version);

    }
}
