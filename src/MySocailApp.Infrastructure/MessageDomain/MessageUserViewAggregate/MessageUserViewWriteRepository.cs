using MySocailApp.Domain.MessageDomain.MessageUserViewAggregate.Abstracts;
using MySocailApp.Domain.MessageDomain.MessageUserViewAggregate.Entities;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.MessageDomain.MessageUserViewAggregate
{
    public class MessageUserViewWriteRepository(AppDbContext context) : IMessageUserViewWriteRepository
    {
        private readonly AppDbContext _context = context;

        public async Task CreateRangeAsync(IEnumerable<MessageUserView> messageUserViews, CancellationToken cancellationToken)
            => await _context.MessageUserViews.AddRangeAsync(messageUserViews,cancellationToken);
    }
}
