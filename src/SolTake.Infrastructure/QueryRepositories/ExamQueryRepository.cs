using Microsoft.EntityFrameworkCore;
using SolTake.Application.Queries.ExamAggregate;
using SolTake.Application.QueryRepositories;
using SolTake.Core;
using SolTake.Infrastructure.DbContexts;
using SolTake.Infrastructure.Extentions;
using SolTake.Infrastructure.QueryRepositories.QueryableMappers;

namespace SolTake.Infrastructure.QueryRepositories
{
    internal class ExamQueryRepository(AppDbContext context) : IExamQueryRepository
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

        public Task<List<ExamResponseDto>> SearchAsync(string? key, IPage page, CancellationToken cancellationToken)
            => _context.Exams
                .AsNoTracking()
                .Where(
                    x =>
                        key == null ||
                        x.Name.Value.ToLower().Contains(key.ToLower()) ||
                        x.Initialism.Value.ToLower().Contains(key.ToLower())
                )
                .ToPage(page)
                .ToExamResponseDto()
                .ToListAsync(cancellationToken);
    }
}
