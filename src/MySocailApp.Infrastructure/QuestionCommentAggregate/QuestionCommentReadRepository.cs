using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.QuestionCommentAggregate.Entities;
using MySocailApp.Domain.QuestionCommentAggregate.Interfaces;
using MySocailApp.Infrastructure.DbContexts;
using MySocailApp.Infrastructure.Extetions;

namespace MySocailApp.Infrastructure.QuestionCommentAggregate
{
    public class QuestionCommentReadRepository(AppDbContext context) : IQuestionCommentReadRepository
    {
        private readonly AppDbContext _context = context;

        public async Task<QuestionComment?> GetByIdAsync(int id, CancellationToken cancellationToken)
            => await _context
                .QuestionComments
                .AsNoTracking()
                .IncludeForQuestionComment()
                .FirstOrDefaultAsync(x => x.Id == id,cancellationToken);

        public async Task<List<QuestionComment>> GetByQuestionIdAsync(int questionId, int? lastId, CancellationToken cancellationToken)
            => await _context.QuestionComments
                .AsNoTracking()
                .IncludeForQuestionComment()
                .Where(x => x.QuestionId == questionId)
                .ToPage(lastId,20)
                .ToListAsync(cancellationToken);
    }
}
