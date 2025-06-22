using Microsoft.EntityFrameworkCore;
using SolTake.Infrastructure.DbContexts;
using SolTake.Domain.CommentUserLikeAggregate.Abstracts;
using SolTake.Domain.CommentUserLikeAggregate.Entities;

namespace SolTake.Infrastructure.CommentDomain.CommentUserLikeAggregate
{
    internal class CommentUserLikeWriteRepository(AppDbContext context) : ICommentUserLikeWriteRepository
    {
        private readonly AppDbContext _context = context;

        public async Task CreateAsync(CommentUserLike commentUserLike, CancellationToken cancellationToken)
            => await _context.CommentUserLikes.AddAsync(commentUserLike, cancellationToken);
        public void Delete(CommentUserLike commentUserLike)
            => _context.CommentUserLikes.Remove(commentUserLike);
        public void DeleteRange(IEnumerable<CommentUserLike> comments)
            => _context.CommentUserLikes.RemoveRange(comments);

        public Task<List<CommentUserLike>> GetByUserId(int userId, CancellationToken cancellationToken)
            => _context.CommentUserLikes.Where(x => x.UserId == userId).ToListAsync(cancellationToken);
        public Task<List<CommentUserLike>> GetByCommentId(int commentId, CancellationToken cancellationToken)
            => _context.CommentUserLikes.Where(x => x.CommentId == commentId).ToListAsync(cancellationToken);

        public Task<CommentUserLike?> GetAsync(int commentId, int userId, CancellationToken cancellationToken)
            => _context.CommentUserLikes.FirstOrDefaultAsync(x => x.CommentId == commentId && x.UserId == userId, cancellationToken);
    }
}
