using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.SolutionAggregate.Entities;
using MySocailApp.Domain.SolutionAggregate.Repositories;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.SolutionAggregate
{
    public class SolutionReadRepository(AppDbContext context) : ISolutionReadRepository
    {
        private readonly AppDbContext _context = context;

        public async Task<Solution?> GetByIdAsync(int id, CancellationToken cancellationToken)
            => await _context
                .Solutions
                .AsNoTracking()
                .Include(x => x.Images)
                .Include(x => x.Votes)
                .FirstOrDefaultAsync(x => x.Id == id,cancellationToken);

        public async Task<List<Solution>> GetByQuestionIdAsync(int questionId,int? lastId,CancellationToken cancellationToken)
            => await _context
                .Solutions
                .AsNoTracking()
                .Include(x => x.Images)
                .Include(x => x.Votes)
                .Where(x => x.QuestionId == questionId && (lastId == null || x.Id < lastId))
                .OrderByDescending(x => x.Id)
                .Take(20)
                .ToListAsync(cancellationToken);
    }
}
