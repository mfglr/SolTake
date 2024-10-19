using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.CommentAggregate.Abstracts;
using MySocailApp.Domain.CommentAggregate.Entities;
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
            => _context.Comments.FirstOrDefaultAsync(x => x.Id == commentId, cancellationToken);

        public Task<Comment?> GetWithLikeByIdAsync(int id, int userId, CancellationToken cancellationToken)
            => _context.Comments
                .Include(x => x.Likes.Where(x => x.AppUserId == userId))
                .Include(x => x.LikeNotifications.Where(x => x.AppUserId == userId))
                .FirstOrDefaultAsync(x => x.Id == id, cancellationToken);

        public Task<Comment?> GetCommentAsync(int commentId, CancellationToken cancellationToken)
            => _context.Comments.FirstOrDefaultAsync(x => x.Id == commentId, cancellationToken);
        public Task<List<Comment>> GetUserCommentsAsync(int userId, CancellationToken cancellationToken)
            => _context.Comments.Where(x => x.AppUserId == userId).ToListAsync(cancellationToken);
        public Task<List<Comment>> GetQuestionCommentsAsync(int questionId, CancellationToken cancellationToken)
            => _context.Comments.Where(x => x.QuestionId == questionId).ToListAsync(cancellationToken);
        public Task<List<Comment>> GetSolutionCommentsAsync(int solutionId, CancellationToken cancellationToken)
            => _context.Comments.Where(x => x.SolutionId == solutionId).ToListAsync(cancellationToken);
        public Task<List<Comment>> GetChildrenAsync(int commentId, CancellationToken cancellationToken)
            => _context.Comments.Where(x => x.ParentId == commentId).ToListAsync(cancellationToken);
        public Task<List<Comment>> GetRepliesAsync(int commentId, CancellationToken cancellationToken)
            => _context.Comments.Where(x => x.RepliedId == commentId).ToListAsync(cancellationToken);

        public async Task RemoveCommentLikesByUserId(int userId, CancellationToken cancellationToken)
        {
            var likes = await _context.CommentUserLikes.Where(x => x.AppUserId == userId).ToListAsync(cancellationToken);
            _context.CommentUserLikes.RemoveRange(likes);
        }
        public async Task RemoveCommentUserLikeNotificationsByUserId(int userId,CancellationToken cancellationToken)
        {
            var notifications = await _context.CommentUserLikeNotifications.Where(x => x.AppUserId == userId).ToListAsync(cancellationToken);
            _context.RemoveRange(notifications);
        }
        public async Task RemoveCommentUserTagsByUserId(int userId, CancellationToken cancellationToken)
        {
            var tags = await _context.CommentUserTags.Where(x => x.AppUserId == userId).ToListAsync(cancellationToken);
            _context.CommentUserTags.RemoveRange(tags);
        }
    }
}
