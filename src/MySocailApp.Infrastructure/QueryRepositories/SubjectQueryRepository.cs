using Microsoft.EntityFrameworkCore;
using MySocailApp.Application.Queries.SubjectAggregate;
using MySocailApp.Application.QueryRepositories;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.QueryRepositories
{
    public class SubjectQueryRepository(AppDbContext context) : ISubjectQueryRepository
    {
        private readonly AppDbContext _context = context;

        public Task<List<SubjectResponseDto>> GetExamSubjectsAsync(int examId, int take, int offset, CancellationToken cancellationToken)
            => _context.Subjects
                .AsNoTracking()
                .Where(x => x.ExamId == examId && x.Id > offset)
                .OrderBy(x => x.Id)
                .Take(take)
                .Select(x => new SubjectResponseDto(x.Id,x.Name))
                .ToListAsync(cancellationToken);
    }
}
