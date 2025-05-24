using Microsoft.EntityFrameworkCore;
using SolTake.Domain.SolutionAggregate.Abstracts;
using SolTake.Domain.SolutionAggregate.Entities;
using SolTake.Infrastructure.DbContexts;

namespace SolTake.Infrastructure.SolutionDomain.SolutionAggregate
{
    public class SolutionWriteRepository(AppDbContext context) : ISolutionWriteRepository
    {
        private readonly AppDbContext _context = context;

        public async Task CreateAsync(Solution solution, CancellationToken cancellationToken)
            => await _context.AddAsync(solution, cancellationToken);

        public void Delete(Solution solution)
            => _context.Solutions.Remove(solution);

        public void DeleteRange(IEnumerable<Solution> solutions)
            => _context.Solutions.RemoveRange(solutions);

        public Task<Solution?> GetByIdAsync(int id, CancellationToken cancellationToken)
            => _context.Solutions
                .Include(x => x.Medias)
                .FirstOrDefaultAsync(x => x.Id == id, cancellationToken);

        public Task<List<Solution>> GetUserSolutionsAsync(int userId, CancellationToken cancellationToken)
            => _context.Solutions
                .Include(x => x.Medias)
                .Where(x => x.UserId == userId)
                .ToListAsync(cancellationToken);

        public Task<List<Solution>> GetQuestionSolutionsAsync(int questionId, CancellationToken cancellationToken)
            => _context.Solutions
                .Include(x => x.Medias)
                .Where(x => x.QuestionId == questionId)
                .ToListAsync(cancellationToken);

        public Task<List<Solution>> GetAsync(List<int> questionIds, int userId, CancellationToken cancellationToken)
            => _context.Solutions
                .Include(x => x.Medias)
                .Where(x => questionIds.Contains(x.QuestionId) && x.UserId == userId)
                .ToListAsync(cancellationToken);
    }
}
