using Microsoft.Extensions.DependencyInjection;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Core;
using MySocailApp.Domain.NotificationAggregate.Interfaces;
using MySocailApp.Domain.QuestionAggregate.DomainEvents;

namespace MySocailApp.Application.DomainEventConsumers.QuestionAggregate.QuestionDislikedDomainEventConsumers
{
    public class DeleteNotification(IServiceProvider serviceProvider) : IDomainEventConsumer<QuestionDislikedDomainEvent>
    {
        private IServiceProvider _serviceProvider = serviceProvider;

        public async Task Handle(QuestionDislikedDomainEvent notification, CancellationToken cancellationToken)
        {
            var scope = _serviceProvider.CreateScope();
            var notificationWriteRepository = scope.ServiceProvider.GetRequiredService<INotificationWriteRepository>();
            var unitOfWork = scope.ServiceProvider.GetRequiredService<IUnitOfWork>();

            var n = await notificationWriteRepository.GetQuestionLikedNotificationAsync(notification.Question.Id, notification.Question.AppUserId, cancellationToken);
            if (n == null) return;

            notificationWriteRepository.Delete(n);
            await unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
