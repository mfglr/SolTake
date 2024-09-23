using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.CommentAggregate.Entities;
using MySocailApp.Domain.CommentAggregate.Interfaces;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.CommentAggregate
{
    public class CommentWriteRepository(AppDbContext context) : ICommentWriteRepository
    {
        private readonly AppDbContext _context = context;

        public async Task CreateAsync(Comment comment, CancellationToken cancellationToken)
            => await _context.AddAsync(comment, cancellationToken);

        public void Delete(Comment comment)
            => _context.Comments.Remove(comment);

        public void DeleteRange(IEnumerable<Comment> comments)
            => _context.Comments.RemoveRange(comments);

        public Task<Comment?> GetAsync(int commentId, CancellationToken cancellationToken)
            => _context.Comments.FirstOrDefaultAsync(x => x.Id == commentId && !x.IsRemoved, cancellationToken);

        public async Task<Comment?> GetWithLikeByIdAsync(int id, int userId, CancellationToken cancellationToken)
            => await _context.Comments
                .Include(x => x.Likes.Where(x => x.AppUserId == userId))
                .Include(x => x.LikeNotifications.Where(x => x.AppUserId == userId))
                .FirstOrDefaultAsync(x => x.Id == id && !x.IsRemoved, cancellationToken);

        public async Task<Comment?> GetWithRepliesAndChildrenAsync(int id, CancellationToken cancellationToken)
            => await _context.Comments
                .Include(x => x.Replies)
                .Include(x => x.Children)
                .FirstOrDefaultAsync(x => x.Id == id, cancellationToken);
    }
}
