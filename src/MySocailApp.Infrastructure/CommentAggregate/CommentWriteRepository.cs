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
            //_context.Comments.RemoveRange(comment.Children);
            //_context.Comments.Remove(comment);
        }

        public async Task<Comment?> GetWithLikeByIdAsync(int id, int userId, CancellationToken cancellationToken)
            => await _context.Comments
                .Include(x => x.Likes.Where(x => x.AppUserId == userId))
                .FirstOrDefaultAsync(x => x.Id == id, cancellationToken);

        public async Task<Comment?> GetWithChildrenAndRepliesById(int id, CancellationToken cancellationToken)
            => await _context.Comments
                //.Include(x => x.Children)
                .Include(x => x.Replies)
                .FirstOrDefaultAsync(x => x.Id == id, cancellationToken);
    }
}
