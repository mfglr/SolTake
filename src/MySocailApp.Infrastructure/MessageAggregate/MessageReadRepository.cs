using Microsoft.EntityFrameworkCore;
using MySocailApp.Core;
using MySocailApp.Domain.MessageAggregate.Entities;
using MySocailApp.Domain.MessageAggregate.Interfaces;
using MySocailApp.Infrastructure.DbContexts;
using MySocailApp.Infrastructure.Extetions;

namespace MySocailApp.Infrastructure.MessageAggregate
{
    public class MessageReadRepository(AppDbContext context) : IMessageReadRepository
    {
        private readonly AppDbContext _context = context;

        public async Task<Message?> GetMessageByIdAsync(int id, CancellationToken cancellationToken)
            => await _context.Messages
                .AsNoTracking()
                .IncludeForMessage()
                .FirstOrDefaultAsync(x => x.Id == id, cancellationToken);


        public async Task<List<Message>> GetMessagesByUserId(int userId1,int userId2,IPagination pagination, CancellationToken cancellationToken)
            => await _context.Messages
                .AsNoTracking()
                .IncludeForMessage()
                .Where(
                    x => 
                        (x.ReceiverId == userId1 && x.SenderId == userId2) || 
                        (x.SenderId == userId1 && x.ReceiverId == userId2)
                )
                .ToPage(pagination)
                .ToListAsync(cancellationToken);

        public async Task<List<Message>> GetConversationsAsync(int userId, int? lastId, int? take, CancellationToken cancellationToken)
           => await _context.Messages
               .AsNoTracking()
               .IncludeForMessage()
               .Where(x => x.SenderId == userId || x.ReceiverId == userId)
               .GroupBy(x => x.SenderId == userId ? x.ReceiverId : x.SenderId)
               .OrderByDescending(x => x.OrderByDescending(x => x.Id).First().Id)
               .Where(x => lastId == null || x.OrderByDescending(x => x.Id).First().Id < lastId)
               .Take(take ?? 20)
               .Select(x => x.OrderByDescending(x => x.Id).First())
               .ToListAsync(cancellationToken);

        public async Task<List<Message>> GetUnviewedMessagesByReceiverId(int receiverId, CancellationToken cancellationToken)
            => await _context.Messages
                .AsNoTracking()
                .IncludeForMessage()
                .Where(x => x.ReceiverId == receiverId && x.Viewers.Count == 0)
                .ToListAsync(cancellationToken);

        public async Task<Message?> GetMessageWithImagesAsync(int id, CancellationToken cancellationToken)
            => await _context.Messages
                .AsNoTracking()
                .Include(x => x.Images)
                .FirstOrDefaultAsync(x => x.Id == id, cancellationToken);
    }
}
