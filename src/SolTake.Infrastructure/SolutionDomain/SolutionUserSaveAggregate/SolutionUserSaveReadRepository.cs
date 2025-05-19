using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.SolutionUserSaveAggregate.Abstracts;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.SolutionDomain.SolutionUserSaveAggregate
{
    public class SolutionUserSaveReadRepository(AppDbContext context) : ISolutionUserSaveReadRepository
    {
        private readonly AppDbContext _context = context;

        public Task<bool> ExistAsync(int solutionId, int userId, CancellationToken cancellationToken)
            => _context.SolutionUserSaves.AnyAsync(x => x.SolutionId == solutionId && x.UserId == userId, cancellationToken);
    }
}
