using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.TopicAggregate;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.TopicAggregate
{
    public class TopicReadRepository(AppDbContext context) : ITopicReadRepository
    {
        private readonly AppDbContext _context = context;

        public async Task<List<Topic>> GetBySubjectId(int subjectId, CancellationToken cancellationToken)
            => await _context.Topics.AsNoTracking().Where(x => x.SubjectId == subjectId).ToListAsync(cancellationToken);
    }
}
