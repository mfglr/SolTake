using MySocailApp.Core;
using MySocailApp.Domain.QuestionDomain.QuestionUserLikeAggregate.Abstracts;
using MySocailApp.Domain.QuestionDomain.QuestionUserLikeAggregate.DomainEvents;
using MySocailApp.Domain.QuestionDomain.QuestionUserLikeAggregate.Entities;
using MySocailApp.Domain.QuestionDomain.QuestionUserLikeAggregate.Exceptions;
using MySocailApp.Domain.QuestionDomain.QuestionUserLikeNotificationAggregate.Abstracts;
using MySocailApp.Domain.QuestionDomain.QuestionUserLikeNotificationAggregate.Entities;

namespace MySocailApp.Domain.QuestionDomain.QuestionUserLikeAggregate.DomainServices
{
    public class QuestionUserLikeCreatorDomainService(IQuestionUserLikeNotificationWriteRepository questionUserLikeNotificationWriteRepository)
    {
        private readonly IQuestionUserLikeNotificationWriteRepository _questionUserLikeNotificationWriteRepository = questionUserLikeNotificationWriteRepository;

        public async Task CreateAsync(QuestionUserLike like, Login login, int questionUserId, CancellationToken cancellationToken)
        {
            var notification = await _questionUserLikeNotificationWriteRepository.GetAsync(like.QuestionId, like.UserId, cancellationToken);
            if (notification == null)
            {
                if (questionUserId != like.UserId)
                    like.AddDomainEvent(new QuestionLikedDomainEvent(like, login, questionUserId));
                notification = QuestionUserLikeNotification.Create(like.QuestionId, like.UserId);
                await _questionUserLikeNotificationWriteRepository.CreateAsync(notification, cancellationToken);
            }
            else
            {
                if (questionUserId != like.UserId && notification.IsValidDate())
                {
                    notification.UpdateCreatedAt();
                    like.AddDomainEvent(new QuestionLikedDomainEvent(like, login, questionUserId));
                }
            }

            like.Create();
        }
    }
}
