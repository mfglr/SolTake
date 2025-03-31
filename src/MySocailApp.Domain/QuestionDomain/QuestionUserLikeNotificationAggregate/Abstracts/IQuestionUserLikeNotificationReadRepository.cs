using MySocailApp.Domain.QuestionDomain.QuestionUserLikeNotificationAggregate.Entities;

namespace MySocailApp.Domain.QuestionDomain.QuestionUserLikeNotificationAggregate.Abstracts
{
    public interface IQuestionUserLikeNotificationReadRepository
    {
        Task<QuestionUserLikeNotification?> GetAsync(int questionId, int userId, CancellationToken cancellationToken);
    }
}
