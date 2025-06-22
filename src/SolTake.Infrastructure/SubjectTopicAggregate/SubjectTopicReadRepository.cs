using Microsoft.EntityFrameworkCore;
using SolTake.Domain.SubjectTopicAggregate.Abstracts;
using SolTake.Infrastructure.DbContexts;

namespace SolTake.Infrastructure.SubjectTopicAggregate
{
    internal class SubjectTopicReadRepository(AppDbContext context) : ISubjectTopicReadRepository
    {
        private readonly AppDbContext _context = context;

        public Task<bool> ExistAsync(int subjectId, int topicId, CancellationToken cancellationToken)
            => _context.SubjectTopics.AnyAsync(x => x.SubjectId == subjectId && x.TopicId == topicId,cancellationToken);
    }
}
