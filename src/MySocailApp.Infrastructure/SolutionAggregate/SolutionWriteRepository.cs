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

        public async Task<Solution?> GetWithCommentsByIdAsync(int id, CancellationToken cancellationToken)
            => await _context.Solutions
                .Include(x => x.Comments)
                .ThenInclude(x => x.Children)
                .Include(x => x.Comments)
                .ThenInclude(x => x.Replies)
                .FirstOrDefaultAsync(x => x.Id == id,cancellationToken);

        public void Delete(Solution solution)
        {
            foreach(var comment in solution.Comments)
            {
                _context.Comments.RemoveRange(comment.Children);
                _context.Comments.Remove(comment);
            }
            _context.Solutions.Remove(solution);
        }
    }
}
