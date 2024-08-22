using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.SolutionAggregate.Entities;
using MySocailApp.Domain.SolutionAggregate.Interfaces;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.SolutionAggregate
{
    public class SolutionWriteRepository(AppDbContext context) : ISolutionWriteRepository
    {
        private readonly AppDbContext _context = context;

        public async Task<Solution?> GetWithVotesByIdAsync(int id, CancellationToken cancellationToken)
            => await _context.Solutions.Include(x => x.Votes).FirstOrDefaultAsync(x => x.Id == id, cancellationToken);

        public async Task CreateAsync(Solution solution, CancellationToken cancellationToken)
            => await _context.AddAsync(solution, cancellationToken);

        public async Task<Solution?> GetByIdAsync(int id, CancellationToken cancellationToken)
            => await _context.Solutions.FirstOrDefaultAsync(x => x.Id == id, cancellationToken);

        public async Task<Solution?> GetWithAllAsync(int id, CancellationToken cancellationToken)
            => await _context.Solutions
                .Include(x => x.Images)
                .Include(x => x.Votes)
                .Include(x => x.Comments)
                .ThenInclude(x => x.Likes)
                
                .FirstOrDefaultAsync(x => x.Id == id, cancellationToken);

        public void Delete(Solution solution, CancellationToken cancellationToken)
        {

        }
    }
}
