using Microsoft.EntityFrameworkCore;
using MySocailApp.Infrastructure.DbContexts;
using SolTake.Domain.AppVersionAggregate.Abstracts;
using SolTake.Domain.AppVersionAggregate.Entities;

namespace MySocailApp.Infrastructure.AppVersionAggregate
{
    public class AppVersionWriteRepository(AppDbContext context) : IAppVersionWriteRepository
    {
        private readonly AppDbContext _context = context;

        public Task<AppVersion> GetLastVersionAsync(CancellationToken cancellationToken)
            => _context.AppVersions.OrderByDescending(x => x.Id).FirstAsync(cancellationToken);

        public async Task CreateAsync(AppVersion version, CancellationToken cancellationToken)
            => await _context.AddAsync(version, cancellationToken);

        public void Delete(AppVersion version)
            => _context.AppVersions.Remove(version);

    }
}
