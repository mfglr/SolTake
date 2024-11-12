using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.VersionAggregate.Abstracts;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.VersionAggregate
{
    public class VersionReadRepository(AppDbContext context) : IVersionReadRepository
    {
        private readonly AppDbContext _context = context;

        public Task<List<Domain.VersionAggregate.Entities.Version>> GetAllVersions(CancellationToken cancellationToken)
            => _context.Versions.ToListAsync(cancellationToken);

        public Task<Domain.VersionAggregate.Entities.Version> GetLastVersionAsync(CancellationToken cancellationToken)
            => _context.Versions.OrderByDescending(x => x.Id).FirstAsync(cancellationToken);
    }
}
