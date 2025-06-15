using Microsoft.EntityFrameworkCore;
using SolTake.Application.Queries.TopicAggregate;
using SolTake.Application.QueryRepositories;
using SolTake.Core;
using SolTake.Infrastructure.DbContexts;
using SolTake.Infrastructure.Extentions;
using SolTake.Infrastructure.QueryRepositories.QueryableMappers;

namespace SolTake.Infrastructure.QueryRepositories
{
    public class TopicQueryRepository(AppDbContext context) : ITopicQueryRepository
    {
        private readonly AppDbContext _context = context;

        public Task<List<TopicResponseDto>> GetSubjectTopicsAsync(int subjectId, IPage page, CancellationToken cancellationToken)
            => _context.SubjectTopics
                .AsNoTracking()
                .Where(x => x.SubjectId == subjectId)
                .ToPage(page)
                .ToTopicResponseDto(_context)
                .ToListAsync(cancellationToken);
    }
}
