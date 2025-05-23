using Microsoft.EntityFrameworkCore;
using SolTake.Application.Queries.MessageDomain;
using SolTake.Application.QueryRepositories;
using MySocailApp.Infrastructure.DbContexts;
using MySocailApp.Infrastructure.QueryRepositories.QueryableMappers;

namespace MySocailApp.Infrastructure.QueryRepositories
{
    public class MessageConnectionQueryRepository(AppDbContext context) : IMessageConnectionQueryRepository
    {

        private readonly AppDbContext _context = context;

        public Task<MessageConnectionResponseDto?> GetById(int id, CancellationToken cancellationToken)
            => _context.MessageConnections
                .AsNoTracking()
                .Where(x => x.Id == id)
                .ToMessageConnectionResponseDto(_context)
                .FirstOrDefaultAsync(cancellationToken);
    }
}
