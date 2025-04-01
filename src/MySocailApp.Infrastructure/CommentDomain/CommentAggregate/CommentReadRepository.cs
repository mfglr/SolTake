using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.CommentDomain.CommentAggregate.Abstracts;
using MySocailApp.Domain.CommentDomain.CommentAggregate.Entities;
using MySocailApp.Infrastructure.DbContexts;

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
    }
}
