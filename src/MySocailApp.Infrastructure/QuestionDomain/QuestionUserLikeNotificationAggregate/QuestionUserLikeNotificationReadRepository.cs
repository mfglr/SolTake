using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.QuestionDomain.QuestionUserLikeNotificationAggregate.Abstracts;
using MySocailApp.Domain.QuestionDomain.QuestionUserLikeNotificationAggregate.Entities;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.QuestionDomain.QuestionUserLikeNotificationAggregate
{
    public class QuestionUserLikeNotificationReadRepository(AppDbContext context) : IQuestionUserLikeNotificationReadRepository
    {
        private readonly AppDbContext _context = context;

        public Task<QuestionUserLikeNotification?> GetAsync(int questionId, int userId, CancellationToken cancellationToken)
            => _context.QuestionUserLikeNotifications
                .AsNoTracking()
                .FirstOrDefaultAsync(x => x.QuestionId == questionId && x.UserId == userId, cancellationToken);
    }
}
