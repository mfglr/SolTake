using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.MessageAggregate.Entities;
using MySocailApp.Domain.MessageAggregate.Interfaces;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.MessageAggregate
{
    public class MessageReadRepository(AppDbContext context) : IMessageReadRepository
    {
        private readonly AppDbContext _context = context;

        public Task<Message?> GetMessageWithImagesAsync(int id, CancellationToken cancellationToken)
            => _context.Messages
                .AsNoTracking()
                .Include(x => x.Images)
                .FirstOrDefaultAsync(x => x.Id == id, cancellationToken);
    }
}
