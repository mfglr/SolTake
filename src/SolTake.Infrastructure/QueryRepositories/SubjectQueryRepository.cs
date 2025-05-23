using Microsoft.EntityFrameworkCore;
using MySocailApp.Application.Queries.SubjectAggregate;
using SolTake.Application.QueryRepositories;
using MySocailApp.Infrastructure.DbContexts;
using MySocailApp.Infrastructure.Extentions;
using MySocailApp.Infrastructure.QueryRepositories.QueryableMappers;
using SolTake.Core;

namespace MySocailApp.Infrastructure.QueryRepositories
{
    public class SubjectQueryRepository(AppDbContext context) : ISubjectQueryRepository
    {
        private readonly AppDbContext _context = context;

        public Task<List<SubjectResponseDto>> GetExamSubjectsAsync(int examId, IPage page, CancellationToken cancellationToken)
            => _context.Subjects
                .AsNoTracking()
                .Where(x => x.ExamId == examId)
                .ToPage(page)
                .ToSubjectResponseDto()
                .ToListAsync(cancellationToken);
    }
}
