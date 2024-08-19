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

        public async Task<Comment?> GetAsync(int commentId, CancellationToken cancellationToken)
            => await _context.Comments.FindAsync(commentId, cancellationToken);

        public void Delete(Comment comment)
        {
            comment.Delete();
            foreach (var child in comment.Children)
                _context.Notifications.RemoveRange(child.Notifications);
            _context.Notifications.RemoveRange(comment.Notifications);
            _context.Comments.Remove(comment);
        }

        public async Task<Comment?> GetWithLikeByIdAsync(int id, int userId, CancellationToken cancellationToken)
            => await _context.Comments
                .Include(x => x.Likes.Where(x => x.AppUserId == userId))
                .FirstOrDefaultAsync(x => x.Id == id, cancellationToken);

        public async Task<Comment?> GetWithAllAsync(int id, CancellationToken cancellationToken)
            => await _context.Comments
                .Include(x => x.Likes)
                .Include(x => x.Tags)
                .Include(x => x.Notifications)
                .Include(x => x.Replies)
                .Include(x => x.Children)
                .ThenInclude(x => x.Likes)
                .Include(x => x.Children)
                .ThenInclude(x => x.Tags)
                .Include(x => x.Children)
                .ThenInclude(x => x.Notifications)
                .Include(x => x.Children)
                .ThenInclude(x => x.Replies)
                .FirstOrDefaultAsync(x => x.Id == id, cancellationToken);
    }
}
