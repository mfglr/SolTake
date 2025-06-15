using Microsoft.EntityFrameworkCore;
using SolTake.Application.Queries.ExamAggregate;
using SolTake.Application.QueryRepositories;
using SolTake.Infrastructure.DbContexts;
using SolTake.Infrastructure.QueryRepositories.QueryableMappers;

namespace SolTake.Infrastructure.QueryRepositories
{
    public class ExamQueryRepository(AppDbContext context) : IExamQueryRepository
    {
        private readonly AppDbContext _context = context;

        public Task<List<ExamResponseDto>> GetAllAsync(CancellationToken cancellationToken)
            => _context.Exams
                .AsNoTracking()
                .ToExamResponseDto()
                .ToListAsync(cancellationToken);

        public Task<ExamResponseDto?> GetExamByIdAsync(int id, CancellationToken cancellationToken)
            => _context.Exams
                .AsNoTracking()
                .Where(x => x.Id == id)
                .ToExamResponseDto()
                .FirstOrDefaultAsync(cancellationToken);
    }
}
