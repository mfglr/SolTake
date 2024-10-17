using MediatR;
using Microsoft.Extensions.DependencyInjection;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Core;
using MySocailApp.Domain.NotificationAggregate.DomainEvents;
using MySocailApp.Domain.NotificationAggregate.Entities;
using MySocailApp.Domain.NotificationAggregate.Interfaces;
using MySocailApp.Domain.QuestionAggregate.DomainEvents;

namespace MySocailApp.Application.DomainEventConsumers.QuestionAggregate.QuestionLikedDomainEventConumers
{
    public class CreateNotification(IServiceProvider serviceProvider) : IDomainEventConsumer<QuestionLikedDomainEvent>
    {
        private readonly IServiceProvider _serviceProvider = serviceProvider;

        public async Task Handle(QuestionLikedDomainEvent notification, CancellationToken cancellationToken)
        {
            var scope = _serviceProvider.CreateScope();
            var notificationWriteRepository = scope.ServiceProvider.GetRequiredService<INotificationWriteRepository>();
            var unitOfWork = scope.ServiceProvider.GetRequiredService<IUnitOfWork>();
            var publisher = scope.ServiceProvider.GetRequiredService<IPublisher>();

            var question = notification.Question;
            var n = Notification.QuestionLikedNotification(question.AppUserId, question.Id, notification.Like.AppUserId);
            await notificationWriteRepository.CreateAsync(n, cancellationToken);
            await unitOfWork.CommitAsync(cancellationToken);

            publisher.Publish(new QuestionLikedNotificationCreatedDomainEvent(n, notification.Like.Id));
        }
    }
}
