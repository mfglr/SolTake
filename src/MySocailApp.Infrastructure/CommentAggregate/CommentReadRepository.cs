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

        public async Task<List<Comment>> GetByParentIdAsync(int parentId, int? lastId,int? take,bool isDescending, CancellationToken cancellationToken)
            => await _context.Comments
                .AsNoTracking()
                .IncludeForComment()
                .Where(x => x.ParentId == parentId)
                .ToPage(lastId,take ?? RecordsPerPage.CommentsPerPage,isDescending)
                .ToListAsync(cancellationToken);

        public async Task<List<Comment>> GetByQuestionIdAsync(int questionId, int? lastId, int? take, CancellationToken cancellationToken)
            => await _context.Comments
                .AsNoTracking()
                .IncludeForComment()
                .Where(x => x.QuestionId == questionId)
                .ToPage(lastId, RecordsPerPage.CommentsPerPage)
                .ToListAsync(cancellationToken);

        public async Task<List<Comment>> GetBySolutoinIdAsync(int solutionId, int? lastId, CancellationToken cancellationToken)
            => await _context.Comments
                .AsNoTracking()
                .IncludeForComment()
                .Where(x => x.SolutionId == solutionId)
                .ToPage(lastId, 20)
                .ToListAsync(cancellationToken);

        public async Task<List<AppUser>> GetCommentLikesAsync(int commentId, int? lastId, int? take, CancellationToken cancellationToken)
            => await _context.AppUsers
                .AsNoTracking()
                .IncludeForUser()
                .Where(x => x.CommentsLiked.Any(x => x.CommentId == commentId))
                .ToPage(lastId, take ?? 20)
                .ToListAsync(cancellationToken);
    }
}
