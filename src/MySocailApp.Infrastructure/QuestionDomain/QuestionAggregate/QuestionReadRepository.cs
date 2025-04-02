using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.QuestionDomain.QuestionAggregate.Abstracts;
using MySocailApp.Domain.QuestionDomain.QuestionAggregate.Entities;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.QuestionDomain.QuestionAggregate
{
    public class QuestionReadRepository(AppDbContext context) : IQuestionReadRepository
    {
        private readonly AppDbContext _context = context;

        public Task<bool> ExistAsync(int id, CancellationToken cancellationToken)
            => _context.Questions.AnyAsync(x => x.Id == id, cancellationToken);

        public Task<Question?> GetAsync(int questionId, CancellationToken cancellationToken)
            => _context
                .Questions
                .AsNoTracking()
                .Include(x => x.Medias)
                .FirstOrDefaultAsync(x => x.Id == questionId, cancellationToken);

        public async Task<int?> GetUserIdOfQuestionAsync(int questionId, CancellationToken cancellationToken)
            => await _context
                .Questions
                .Where(x => x.Id == questionId)
                .Select(x => x.UserId)
                .FirstOrDefaultAsync(cancellationToken);
    }
}
