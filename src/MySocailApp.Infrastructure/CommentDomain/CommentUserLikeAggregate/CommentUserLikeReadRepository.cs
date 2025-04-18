using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.CommentUserLikeAggregate.Abstracts;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.CommentDomain.CommentUserLikeAggregate
{
    public class CommentUserLikeReadRepository(AppDbContext context) : ICommentUserLikeReadRepository
    {
        private readonly AppDbContext _context = context;

        public Task<bool> ExistAsync(int commentId, int userId, CancellationToken cancellationToken)
            => _context.CommentUserLikes.AnyAsync(x => x.CommentId == commentId && x.UserId == userId, cancellationToken);
    }
}
