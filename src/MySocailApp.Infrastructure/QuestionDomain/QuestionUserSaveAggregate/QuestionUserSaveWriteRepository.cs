using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.QuestionDomain.QuestionUserSaveAggregate.Abstracts;
using MySocailApp.Domain.QuestionDomain.QuestionUserSaveAggregate.Entities;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.QuestionDomain.QuestionUserSaveAggregate
{
    public class QuestionUserSaveWriteRepository(AppDbContext context) : IQuestionUserSaveWriteRepository
    {
        private readonly AppDbContext _context = context;

        public async Task CreateAsync(QuestionUserSave questionUserSave, CancellationToken cancellationToken)
            => await _context.QuestionUserSaves.AddAsync(questionUserSave, cancellationToken);

        public void Delete(QuestionUserSave questionUserSave)
            => _context.QuestionUserSaves.Remove(questionUserSave);

        public void DeleteRange(IEnumerable<QuestionUserSave> questionUserSaves)
            => _context.QuestionUserSaves.RemoveRange(questionUserSaves);

        public Task<QuestionUserSave?> GetAsync(int questionId, int userId, CancellationToken cancellationToken)
            => _context.QuestionUserSaves.FirstOrDefaultAsync(x => x.QuestionId == questionId && x.UserId == userId,cancellationToken);

        public Task<List<QuestionUserSave>> GetByUserId(int userId, CancellationToken cancellationToken)
            => _context.QuestionUserSaves.Where(x => x.UserId == userId).ToListAsync(cancellationToken);
    }
}
