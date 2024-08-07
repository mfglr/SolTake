using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.SolutionAggregate.Entities;
using MySocailApp.Domain.SolutionAggregate.Interfaces;
using MySocailApp.Infrastructure.DbContexts;
using MySocailApp.Infrastructure.Extetions;

namespace MySocailApp.Infrastructure.SolutionAggregate
{
    public class SolutionReadRepository(AppDbContext context) : ISolutionReadRepository
    {
        private readonly AppDbContext _context = context;

        public async Task<bool> Exist(int id, CancellationToken cancellationToken)
            => await _context.Solutions.AnyAsync(x => x.Id == id, cancellationToken);

        public async Task<Solution?> GetAsync(int id, CancellationToken cancellationToken)
            => await _context.Solutions.AsNoTracking().FirstOrDefaultAsync(x => x.Id == id, cancellationToken);

        public async Task<Solution?> GetSolutionWithImagesByIdAsync(int id,CancellationToken cancellationToken)
            => await _context.Solutions
                .AsNoTracking()
                .Include(x => x.Images)
                .FirstOrDefaultAsync(x => x.Id == id, cancellationToken);

        public async Task<Solution?> GetByIdAsync(int id, CancellationToken cancellationToken)
            => await _context
                .Solutions
                .AsNoTracking()
                .IncludeForSolution()
                .FirstOrDefaultAsync(x => x.Id == id,cancellationToken);

        public async Task<List<Solution>> GetByQuestionIdAsync(int questionId,int? lastId,CancellationToken cancellationToken)
            => await _context
                .Solutions
                .AsNoTracking()
                .IncludeForSolution()
                .Where(x => x.QuestionId == questionId && (lastId == null || x.Id < lastId))
                .OrderByDescending(x => x.Id)
                .Take(20)
                .ToListAsync(cancellationToken);
    }
}
