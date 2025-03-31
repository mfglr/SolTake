using MySocailApp.Domain.QuestionDomain.QuestionUserLikeNotificationAggregate.Entities;

namespace MySocailApp.Domain.QuestionDomain.QuestionUserLikeNotificationAggregate.Abstracts
{
    public interface IQuestionUserLikeNotificationWriteRepository
    {
        Task CreateAsync(QuestionUserLikeNotification questionUserLikeNotification,CancellationToken cancellationToken);
        void Delete(QuestionUserLikeNotification questionUserLikeNotification);
        void DeleteRange(IEnumerable<QuestionUserLikeNotification> questionUserLikeNotifications);

        Task<QuestionUserLikeNotification?> GetAsync(int questionId, int userId, CancellationToken cancellationToken);
        Task<List<QuestionUserLikeNotification>> GetByQuestionId(int questionId,CancellationToken cancellationToken);
        Task<List<QuestionUserLikeNotification>> GetByUserId(int userId,CancellationToken cancellationToken);
    }
}
