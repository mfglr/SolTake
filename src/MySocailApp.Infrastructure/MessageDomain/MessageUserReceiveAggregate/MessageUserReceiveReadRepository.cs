using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.MessageDomain.MessageUserReceiveAggregate.Abstracts;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.MessageDomain.MessageUserReceiveAggregate
{
    public class MessageUserReceiveReadRepository(AppDbContext context) : IMessageUserReceiveReadRepository
    {
        private readonly AppDbContext _context = context;

        public Task<bool> ExistAsync(int messageId, int userId, CancellationToken cancellationToken)
            => _context.MessageUserReceives.AnyAsync(x => x.MessageId == messageId && x.UserId == userId, cancellationToken);
    }
}
