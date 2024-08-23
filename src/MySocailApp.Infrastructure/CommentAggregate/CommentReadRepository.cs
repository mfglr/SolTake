using Microsoft.EntityFrameworkCore;
using MySocailApp.Core;
using MySocailApp.Domain.AppUserAggregate.Entities;
using MySocailApp.Domain.CommentAggregate.Entities;
using MySocailApp.Domain.CommentAggregate.Interfaces;
using MySocailApp.Infrastructure.DbContexts;
using MySocailApp.Infrastructure.Extetions;

namespace MySocailApp.Infrastructure.CommentAggregate
{
    public class CommentReadRepository(AppDbContext context) : ICommentReadRepository
    {
        private readonly AppDbContext _context = context;

        public async Task<bool> Exist(int id, CancellationToken cancellationToken)
            => await _context.Comments.AnyAsync(x => x.Id == id, cancellationToken);

        public async Task<Comment?> GetAsync(int id, CancellationToken cancellationToken)
            => await _context.Comments
                .AsNoTracking()
                .FirstOrDefaultAsync(x => x.Id == id, cancellationToken);

        public async Task<Comment?> GetByIdAsync(int id, CancellationToken cancellationToken)
            => await _context.Comments
                .AsNoTracking()
                .IncludeForComment()
                .FirstOrDefaultAsync(x => x.Id == id, cancellationToken);

        public async Task<List<Comment>> GetByIds(IEnumerable<int> ids, CancellationToken cancellationToken)
            => await _context.Comments
                .AsNoTracking()
                .IncludeForComment()
                .Where(x => ids.Any(id => x.Id == id))
                .ToListAsync(cancellationToken);

        public async Task<List<Comment>> GetCommentsByParentIdAsync(int parentId, IPagination pagination, CancellationToken cancellationToken)
            => await _context.Comments
                .AsNoTracking()
                .IncludeForComment()
                .Where(x => x.ParentId == parentId)
                .ToPage(pagination)
                .ToListAsync(cancellationToken);

        public async Task<List<Comment>> GetCommentsByQuestionIdAsync(int questionId, IPagination pagination, CancellationToken cancellationToken)
            => await _context.Comments
                .AsNoTracking()
                .IncludeForComment()
                .Where(x => x.QuestionId == questionId)
                .ToPage(pagination)
                .ToListAsync(cancellationToken);

        public async Task<List<Comment>> GetCommentsBySolutionIdAsync(int solutionId, IPagination pagination, CancellationToken cancellationToken)
            => await _context.Comments
                .AsNoTracking()
                .IncludeForComment()
                .Where(x => x.SolutionId == solutionId)
                .ToPage(pagination)
                .ToListAsync(cancellationToken);

        public async Task<List<AppUser>> GetCommentLikesAsync(int commentId, IPagination pagination, CancellationToken cancellationToken)
            => await _context.AppUsers
                .AsNoTracking()
                .IncludeForUser()
                .Where(x => x.CommentsLiked.Any(x => x.CommentId == commentId))
                .ToPage(pagination)
                .ToListAsync(cancellationToken);
    }
}
