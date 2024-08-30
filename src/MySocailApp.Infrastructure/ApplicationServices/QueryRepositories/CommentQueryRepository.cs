using Microsoft.EntityFrameworkCore;
using MySocailApp.Application.ApplicationServices.QueryRepositories;
using MySocailApp.Application.Queries.CommentAggregate;
using MySocailApp.Core;
using MySocailApp.Infrastructure.DbContexts;
using MySocailApp.Infrastructure.Extetions;
using MySocailApp.Infrastructure.Extetions.QueryableMappers;

namespace MySocailApp.Infrastructure.ApplicationServices.QueryRepositories
{
    public class CommentQueryRepository(AppDbContext context) : ICommentQueryRepository
    {
        private readonly AppDbContext _context = context;

        public Task<CommentResponseDto?> GetByIdAsync(int accountId, int commentId, CancellationToken cancellationToken)
            => _context.Comments
                .AsNoTracking()
                .Where(x => x.Id == commentId)
                .ToCommentResponseDto(accountId)
                .FirstOrDefaultAsync(cancellationToken);

        public Task<List<CommentResponseDto>> GetByIds(int accountId, IEnumerable<int> ids, CancellationToken cancellationToken)
            => _context.Comments
                .AsNoTracking()
                .Where(x => ids.Any(id => x.Id == id))
                .ToCommentResponseDto(accountId)
                .ToListAsync(cancellationToken);

        public async Task<List<CommentResponseDto>> GetCommentsByQuestionIdAsync(int accountId, IPage page, int questionId,  CancellationToken cancellationToken)
            => await _context.Comments
                .AsNoTracking()
                .Where(x => x.QuestionId == questionId)
                .ToPage(page)
                .ToCommentResponseDto(accountId)
                .ToListAsync(cancellationToken);

        public Task<List<CommentResponseDto>> GetCommentsByParentIdAsync(int accountId, IPage page, int parentId, CancellationToken cancellationToken)
            => _context.Comments
                .AsNoTracking()
                .Where(x => x.ParentId == parentId)
                .ToPage(page)
                .ToCommentResponseDto(accountId)
                .ToListAsync(cancellationToken);

        public async Task<List<CommentResponseDto>> GetCommentsBySolutionIdAsync(int accountId, IPage page, int solutionId, CancellationToken cancellationToken)
            => await _context.Comments
                .AsNoTracking()
                .Where(x => x.SolutionId == solutionId)
                .ToPage(page)
                .ToCommentResponseDto(accountId)
                .ToListAsync(cancellationToken);
    }
}
