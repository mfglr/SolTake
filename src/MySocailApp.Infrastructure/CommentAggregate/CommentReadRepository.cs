using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.CommentAggregate.Entities;
using MySocailApp.Domain.CommentAggregate.Interfaces;
using MySocailApp.Infrastructure.DbContexts;
using MySocailApp.Infrastructure.Extetions;

namespace MySocailApp.Infrastructure.CommentAggregate
{
    public class CommentReadRepository(AppDbContext context) : ICommentReadRepository
    {
        private readonly AppDbContext _context = context;

        public async Task<Comment?> GetByIdAsync(int id, CancellationToken cancellationToken)
            => await _context.Comments
                .AsNoTracking()
                .IncludeForQuestionComment()
                .FirstOrDefaultAsync(x => x.Id == id, cancellationToken);

        public async Task<List<Comment>> GetByParentIdAsync(int parentId,int? lastId,int? take,CancellationToken cancellationToken)
            => await _context.Comments
                .AsNoTracking()
                .IncludeForQuestionComment()
                .Where(x => x.ParentId == parentId)
                .ToPage(lastId,take ?? 20)
                .ToListAsync(cancellationToken);

        public async Task<List<Comment>> GetByQuestionIdAsync(int questionId, int? lastId, CancellationToken cancellationToken)
            => await _context.Comments
                .AsNoTracking()
                .IncludeForQuestionComment()
                .Where(x => x.QuestionId == questionId)
                .ToPage(lastId, 20)
                .ToListAsync(cancellationToken);

        public async Task<List<Comment>> GetBySolutoinIdAsync(int solutionId, int? lastId, CancellationToken cancellationToken)
            => await _context.Comments
                .AsNoTracking()
                .IncludeForQuestionComment()
                .Where(x => x.SolutionId == solutionId)
                .ToPage(lastId, 20)
                .ToListAsync(cancellationToken);
    }
}
