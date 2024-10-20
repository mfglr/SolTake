﻿using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Core;
using MySocailApp.Domain.NotificationAggregate.DomainEvents;
using MySocailApp.Domain.NotificationAggregate.Entities;
using MySocailApp.Domain.NotificationAggregate.Interfaces;
using MySocailApp.Domain.SolutionAggregate.DomainEvents;

namespace MySocailApp.Application.DomainEventConsumers.SolutionCreatedDomainEventConsumers.NotificationAggregate
{
    public class CreateNotification(INotificationWriteRepository notificationWriteRepository, IUnitOfWork unitOfWork, IPublisher publisher) : IDomainEventConsumer<SolutionCreatedDomainEvent>
    {
        private readonly INotificationWriteRepository _notificationWriteRepository = notificationWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IPublisher _publisher = publisher;

        public async Task Handle(SolutionCreatedDomainEvent notification, CancellationToken cancellationToken)
        {
            var solution = notification.Solution;
            var question = notification.Question;

            var n = Notification.SolutionCreatedNotification(question.AppUserId, question.Id, solution.Id, solution.AppUserId);
            await _notificationWriteRepository.CreateAsync(n, cancellationToken);
            await _unitOfWork.CommitAsync(cancellationToken);
            await _publisher.Publish(new SolutionNotificationCreatedDomainEvent(n), cancellationToken);
        }
    }
}
