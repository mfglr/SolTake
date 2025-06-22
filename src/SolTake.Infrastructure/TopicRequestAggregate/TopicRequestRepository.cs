using Microsoft.EntityFrameworkCore;
using SolTake.Domain.TopicRequestAggregate.Abstracts;
using SolTake.Domain.TopicRequestAggregate.Entities;
using SolTake.Infrastructure.DbContexts;

namespace SolTake.Infrastructure.TopicRequestAggregate
{
    internal class TopicRequestRepository(AppDbContext context) : ITopicRequestRepository
    {
        private readonly AppDbContext _context = context;

        public async Task CreateAsync(TopicRequest topicCreationRequest, CancellationToken cancellationToken)
            => await _context.TopicRequests.AddAsync(topicCreationRequest, cancellationToken);

        public void Delete(TopicRequest topicRequest)
            => _context.TopicRequests.Remove(topicRequest);

        public Task<TopicRequest?> GetByIdAsync(int id, CancellationToken cancellationToken)
            => _context.TopicRequests.FirstOrDefaultAsync(x => x.Id == id, cancellationToken);
    }
}
