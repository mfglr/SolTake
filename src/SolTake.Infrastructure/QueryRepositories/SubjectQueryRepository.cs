using Microsoft.EntityFrameworkCore;
using SolTake.Application.Queries.SubjectAggregate;
using SolTake.Application.QueryRepositories;
using SolTake.Core;
using SolTake.Infrastructure.DbContexts;
using SolTake.Infrastructure.Extentions;
using SolTake.Infrastructure.QueryRepositories.QueryableMappers;

namespace SolTake.Infrastructure.QueryRepositories
{
    internal class SubjectQueryRepository(AppDbContext context) : ISubjectQueryRepository
    {
        private readonly AppDbContext _context = context;

        public Task<List<SubjectResponseDto>> GetExamSubjectsAsync(int examId, IPage page, CancellationToken cancellationToken)
            => _context.Subjects
                .AsNoTracking()
                .Where(x => x.ExamId == examId)
                .ToPage(page)
                .ToSubjectResponseDto()
                .ToListAsync(cancellationToken);

        public Task<List<SubjectResponseDto>> SearchSubjectsAsync(string? key, IPage page, CancellationToken cancellationToken)
            => _context.Subjects
                .AsNoTracking()
                .Where(x => key == null || x.Name.ToLower().Contains(key.ToLower()))
                .ToPage(page)
                .ToSubjectResponseDto()
                .ToListAsync(cancellationToken);
    }
}
