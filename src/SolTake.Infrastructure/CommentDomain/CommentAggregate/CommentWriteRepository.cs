using Microsoft.EntityFrameworkCore;
using SolTake.Infrastructure.DbContexts;
using SolTake.Domain.CommentAggregate.Abstracts;
using SolTake.Domain.CommentAggregate.Entities;

namespace SolTake.Infrastructure.CommentDomain.CommentAggregate
{
    internal class CommentWriteRepository(AppDbContext context) : ICommentWriteRepository
    {
        private readonly AppDbContext _context = context;

        public async Task CreateAsync(Comment comment, CancellationToken cancellationToken)
            => await _context.AddAsync(comment, cancellationToken);

        public void Delete(Comment comment)
            => _context.Comments.Remove(comment);

        public void DeleteRange(IEnumerable<Comment> comments)
            => _context.Comments.RemoveRange(comments);

        public Task<Comment?> GetAsync(int commentId, CancellationToken cancellationToken)
            => _context
                .Comments
                .Include(x => x.Tags)
                .FirstOrDefaultAsync(x => x.Id == commentId, cancellationToken);
        
        public Task<Comment?> GetCommentAsync(int commentId, CancellationToken cancellationToken)
            => _context
                .Comments
                .Include(x => x.Tags)
                .FirstOrDefaultAsync(x => x.Id == commentId, cancellationToken);
        
        public Task<List<Comment>> GetUserCommentsAsync(int userId, CancellationToken cancellationToken)
            => _context
                .Comments
                .Include(x => x.Tags)
                .Where(x => x.UserId == userId).ToListAsync(cancellationToken);
        
        public Task<List<Comment>> GetQuestionCommentsAsync(int questionId, CancellationToken cancellationToken)
            => _context
                .Comments
                .Include(x => x.Tags)
                .Where(x => x.QuestionId == questionId).ToListAsync(cancellationToken);
        
        public Task<List<Comment>> GetSolutionCommentsAsync(int solutionId, CancellationToken cancellationToken)
            => _context
                .Comments
                .Include(x => x.Tags)
                .Where(x => x.SolutionId == solutionId).ToListAsync(cancellationToken);
        
        public Task<List<Comment>> GetChildrenAsync(int commentId, CancellationToken cancellationToken)
            => _context
                .Comments
                .Include(x => x.Tags)
                .Where(x => x.ParentId == commentId).ToListAsync(cancellationToken);
        
        public Task<List<Comment>> GetRepliesAsync(int commentId, CancellationToken cancellationToken)
            => _context
                .Comments
                .Include(x => x.Tags)
                .Where(x => x.RepliedId == commentId)
                .ToListAsync(cancellationToken);
        
        public Task<List<Comment>> GetCommentsByTag(int userId,CancellationToken cancellationToken)
            => _context
                .Comments
                .Include(x => x.Tags)
                .Where(x => x.Tags.Any(x => x.UserId == userId))
                .ToListAsync(cancellationToken);

        public Task<List<Comment>> GetQuestionsComments(IEnumerable<int> questionIds, int userId, CancellationToken cancellationToken)
            => _context.Comments
                .Include(x => x.Tags)
                .Where(x => questionIds.Any(questionId => questionId == x.QuestionId) && x.UserId == userId)
                .ToListAsync(cancellationToken);

        public Task<List<Comment>> GetSolutionsComments(IEnumerable<int> solutionIds, int userId, CancellationToken cancellationToken)
           => _context.Comments
               .Include(x => x.Tags)
               .Where(x => solutionIds.Any(solutionId => solutionId == x.SolutionId) && x.UserId == userId)
               .ToListAsync(cancellationToken);

        public Task<List<Comment>> GetCommentsReplies(IEnumerable<int> commentIds, int userId, CancellationToken cancellationToken)
            => _context.Comments
                .Include(x => x.Tags)
                .Where(x => commentIds.Any(commentId => x.ParentId == commentId) && x.UserId == userId)
                .ToListAsync(cancellationToken);
    }
}
