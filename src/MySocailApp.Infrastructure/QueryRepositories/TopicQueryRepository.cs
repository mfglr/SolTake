using Microsoft.EntityFrameworkCore;
using MySocailApp.Application.Queries.TopicAggregate;
using MySocailApp.Application.QueryRepositories;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.QueryRepositories
{
    public class TopicQueryRepository(AppDbContext context) : ITopicQueryRepository
    {
        private readonly AppDbContext _context = context;

        public Task<List<TopicResponseDto>> GetSubjectTopicsAsync(int subjectId, int offset, int take, CancellationToken cancellationToken)
            => _context.Topics
                .AsNoTracking()
                .Join(_context.SubjectTopics,t => t.Id,st => st.TopicId,(t,st) => new { t.Id, t.Name, st.SubjectId })
                .Where(x => x.SubjectId == subjectId && x.Id > offset)
                .OrderBy(x => x.Id)
                .Take(take)
                .Select(x => new TopicResponseDto(x.Id,x.Name))
                .ToListAsync(cancellationToken);
    }
}
