using Microsoft.EntityFrameworkCore;
using SolTake.Domain.SubjectTopicAggregate.Abstracts;
using SolTake.Domain.SubjectTopicAggregate.Entities;
using SolTake.Infrastructure.DbContexts;

namespace SolTake.Infrastructure.SubjectTopicAggregate
{
    internal class SubjectTopicWriteRepository(AppDbContext context) : ISubjectTopicWriteRepository
    {
        private readonly AppDbContext _context = context;

        public async Task CreateAsync(SubjectTopic subjectTopic, CancellationToken cancellationToken)
            => await _context.SubjectTopics.AddAsync(subjectTopic, cancellationToken);

        public void DeleteRange(List<SubjectTopic> subjectTopics)
            => _context.SubjectTopics.RemoveRange(subjectTopics);

        public Task<List<SubjectTopic>> GetByTopicIdAsync(int topicId, CancellationToken cancellationToken)
            => _context.SubjectTopics.Where(x => x.TopicId == topicId).ToListAsync(cancellationToken);
    }
}
