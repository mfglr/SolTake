using Microsoft.EntityFrameworkCore;
using SolTake.Domain.QuestionDomain.QuestionUserSaveAggregate.Abstracts;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.QuestionDomain.QuestionUserSaveAggregate
{
    public class QuestionUserSaveReadRepository(AppDbContext context) : IQuestionUserSaveReadRepository
    {
        private readonly AppDbContext _context = context;

        public Task<bool> ExistAsync(int questionId, int userId, CancellationToken cancellationToken)
            => _context.QuestionUserSaves.AnyAsync(x => x.QuestionId == questionId && x.UserId == userId, cancellationToken);
    }
}
