using Microsoft.EntityFrameworkCore;
using MySocailApp.Application.Queries.TopicAggregate;
using MySocailApp.Application.QueryRepositories;
using MySocailApp.Core;
using MySocailApp.Infrastructure.DbContexts;
using MySocailApp.Infrastructure.Extetions;
using MySocailApp.Infrastructure.QueryRepositories.QueryableMappers;

namespace MySocailApp.Infrastructure.QueryRepositories
{
    public class TopicQueryRepository(AppDbContext context) : ITopicQueryRepository
    {
        private readonly AppDbContext _context = context;

        public Task<List<TopicResponseDto>> GetSubjectTopicsAsync(int subjectId, IPage page, CancellationToken cancellationToken)
            => _context.Topics
                .AsNoTracking()
                .Where(t => _context.SubjectTopics.Any(st => st.SubjectId == subjectId && st.TopicId == t.Id))
                .ToPage(page)
                .ToTopicResponseDto()
                .ToListAsync(cancellationToken);
    }
}
