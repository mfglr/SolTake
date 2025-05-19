using Microsoft.EntityFrameworkCore;
using MySocailApp.Infrastructure.DbContexts;
using SolTake.Domain.CommentAggregate.Abstracts;
using SolTake.Domain.CommentAggregate.Entities;

namespace MySocailApp.Infrastructure.CommentDomain.CommentAggregate
{
    public class CommentReadRepository(AppDbContext context) : ICommentReadRepository
    {
        private readonly AppDbContext _context = context;

        public Task<bool> Exist(int id, CancellationToken cancellationToken)
            => _context.Comments.AnyAsync(x => x.Id == id, cancellationToken);

        public Task<Comment?> GetAsync(int id, CancellationToken cancellationToken)
            => _context.Comments
                .AsNoTracking()
                .FirstOrDefaultAsync(x => x.Id == id, cancellationToken);

        

        public Task<int?> GetParentId(int id, CancellationToken cancellationToken)
            => _context.Comments
                .Where(x => x.Id == id)
                .Select(x => x.ParentId)
                .FirstOrDefaultAsync(cancellationToken);


        public Task<List<int>> GetCommentIdsOfUser(int userId, CancellationToken cancellationToken)
            => _context.Comments
                .AsNoTracking()
                .Where(x => x.UserId == userId)
                .Select(x => x.Id)
                .ToListAsync(cancellationToken);
    }
}
