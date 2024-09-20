using Microsoft.EntityFrameworkCore;
using MySocailApp.Application.Queries.SubjectAggregate;
using MySocailApp.Application.QueryRepositories;
using MySocailApp.Core;
using MySocailApp.Infrastructure.DbContexts;
using MySocailApp.Infrastructure.Extetions;
using MySocailApp.Infrastructure.QueryRepositories.QueryableMappers;

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
