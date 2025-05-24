using Microsoft.EntityFrameworkCore;
using SolTake.Application.Queries.MessageDomain;
using SolTake.Application.QueryRepositories;
using SolTake.Infrastructure.DbContexts;
using SolTake.Infrastructure.QueryRepositories.QueryableMappers;

namespace SolTake.Infrastructure.QueryRepositories
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
