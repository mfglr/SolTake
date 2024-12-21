using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.MessageDomain.MessageAggregate.Entities;
using MySocailApp.Domain.MessageDomain.MessageAggregate.Interfaces;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.MessageAggregate
{
    public class MessageReadRepository(AppDbContext context) : IMessageReadRepository
    {
        private readonly AppDbContext _context = context;

        public Task<Message?> GetMessageWithImagesAsync(int accountId, int id, CancellationToken cancellationToken)
            => _context.Messages
                .AsNoTracking()
                .Include(x => x.Medias)
                .FirstOrDefaultAsync(x => x.Id == id && !x.Removers.Any(x => x.UserId == accountId), cancellationToken);
    }
}
