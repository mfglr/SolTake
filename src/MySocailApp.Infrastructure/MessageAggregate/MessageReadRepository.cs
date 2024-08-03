using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.MessageAggregate.Entities;
using MySocailApp.Domain.MessageAggregate.Interfaces;
using MySocailApp.Infrastructure.DbContexts;
using MySocailApp.Infrastructure.Extetions;

namespace MySocailApp.Infrastructure.MessageAggregate
{
    public class MessageReadRepository(AppDbContext context) : IMessageReadRepository
    {
        private readonly AppDbContext _context = context;

        public async Task<List<Message>> GetMessagesByUserId(int userId1,int userId2,int? lastId,int? take,CancellationToken cancellationToken)
            => await _context.Messages
                .AsNoTracking()
                .Include(x => x.Receivers)
                .Include(x => x.Viewers)
                .Where(
                    x => 
                        (x.ReceiverId == userId1 && x.SenderId == userId2) || 
                        (x.SenderId == userId1 && x.ReceiverId == userId2)
                )
                .ToPage(lastId,take)
                .ToListAsync(cancellationToken);
    }
}
