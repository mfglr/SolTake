using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.QuestionDomain.QuestionUserLikeNotificationAggregate.Abstracts;
using MySocailApp.Domain.QuestionDomain.QuestionUserLikeNotificationAggregate.Entities;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.QuestionDomain.QuestionUserLikeNotificationAggregate
{
    internal class QuestionUserLikeNotificationWriteRepository(AppDbContext context) : IQuestionUserLikeNotificationWriteRepository
    {
        private readonly AppDbContext _context = context;

        public async Task CreateAsync(QuestionUserLikeNotification questionUserLikeNotification, CancellationToken cancellationToken)
            => await _context.QuestionUserLikeNotifications.AddAsync(questionUserLikeNotification, cancellationToken);

        public void Delete(QuestionUserLikeNotification questionUserLikeNotification)
            => _context.QuestionUserLikeNotifications.Remove(questionUserLikeNotification);

        public void DeleteRange(IEnumerable<QuestionUserLikeNotification> questionUserLikeNotifications)
            => _context.RemoveRange(questionUserLikeNotifications);

        public async Task<QuestionUserLikeNotification?> GetAsync(int questionId, int userId, CancellationToken cancellationToken)
            => await _context.QuestionUserLikeNotifications.FirstOrDefaultAsync(x => x.QuestionId == questionId && x.UserId == userId,cancellationToken);

        public Task<List<QuestionUserLikeNotification>> GetByQuestionId(int questionId, CancellationToken cancellationToken)
            => _context.QuestionUserLikeNotifications.Where(x => x.QuestionId == questionId).ToListAsync(cancellationToken);

        public Task<List<QuestionUserLikeNotification>> GetByUserId(int userId, CancellationToken cancellationToken)
            => _context.QuestionUserLikeNotifications.Where(x => x.UserId == userId).ToListAsync(cancellationToken);
    }
}
