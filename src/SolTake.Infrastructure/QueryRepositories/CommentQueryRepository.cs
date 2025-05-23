using Microsoft.EntityFrameworkCore;
using SolTake.Application.Queries.CommentAggregate;
using SolTake.Application.QueryRepositories;
using MySocailApp.Infrastructure.DbContexts;
using MySocailApp.Infrastructure.Extentions;
using MySocailApp.Infrastructure.QueryRepositories.QueryableMappers;
using SolTake.Core;

namespace MySocailApp.Infrastructure.QueryRepositories
{
    public class CommentQueryRepository(AppDbContext context) : ICommentQueryRepository
    {
        private readonly AppDbContext _context = context;

        public Task<CommentResponseDto?> GetByIdAsync(int accountId, int commentId, CancellationToken cancellationToken)
            => _context.Comments
                .AsNoTracking()
                .Where(x => x.Id == commentId)
                .ToCommentResponseDto(_context, accountId)
                .FirstOrDefaultAsync(cancellationToken);

        public Task<List<CommentResponseDto>> GetByIdsAsync(int accountId, IEnumerable<int> ids, CancellationToken cancellationToken)
            => _context.Comments
                .AsNoTracking()
                .Where(x => ids.Any(id => x.Id == id))
                .ToCommentResponseDto(_context, accountId)
                .ToListAsync(cancellationToken);

        public async Task<List<CommentResponseDto>> GetCommentsByQuestionIdAsync(int accountId, IPage page, int questionId, CancellationToken cancellationToken)
            => await _context.Comments
                .AsNoTracking()
                .Where(
                    comment =>
                        comment.QuestionId == questionId &&
                        !_context.UserUserBlocks.Any(uub => uub.BlockerId == comment.UserId && uub.BlockedId == accountId)
                )
                .ToPage(page)
                .ToCommentResponseDto(_context, accountId)
                .ToListAsync(cancellationToken);

        public Task<List<CommentResponseDto>> GetCommentsByParentIdAsync(int accountId, IPage page, int parentId, CancellationToken cancellationToken)
            => _context.Comments
                .AsNoTracking()
                .Where(
                    comment => comment.ParentId == parentId &&
                    !_context.UserUserBlocks.Any(uub => uub.BlockerId == comment.UserId && uub.BlockedId == accountId)
                )
                .ToPage(page)
                .ToCommentResponseDto(_context, accountId)
                .ToListAsync(cancellationToken);

        public async Task<List<CommentResponseDto>> GetCommentsBySolutionIdAsync(int accountId, IPage page, int solutionId, CancellationToken cancellationToken)
            => await _context.Comments
                .AsNoTracking()
                .Where(
                    comment => 
                        comment.SolutionId == solutionId && 
                        !_context.UserUserBlocks.Any(uub => uub.BlockerId == comment.UserId && uub.BlockedId == accountId)
                )
                .ToPage(page)
                .ToCommentResponseDto(_context, accountId)
                .ToListAsync(cancellationToken);
    }
}
