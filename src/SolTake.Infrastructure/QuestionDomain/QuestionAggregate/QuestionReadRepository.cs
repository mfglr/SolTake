using Microsoft.EntityFrameworkCore;
using SolTake.Domain.QuestionAggregate.Abstracts;
using SolTake.Domain.QuestionAggregate.Entities;
using SolTake.Infrastructure.DbContexts;

namespace SolTake.Infrastructure.QuestionDomain.QuestionAggregate
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

        public Task<List<int>> GetQuestionIdsOfUser(int userId, CancellationToken cancellationToken)
            => _context.Questions.Where(x => x.UserId == userId).Select(x => x.Id).ToListAsync(cancellationToken);

    }
}
