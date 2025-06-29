﻿using MediatR;
using SolTake.Application.InfrastructureServices;
using SolTake.Domain.CommentAggregate.DomainEvents;
using SolTake.Domain.NotificationDomain.NotificationAggregate.DomainEvents;
using SolTake.Domain.NotificationDomain.NotificationAggregate.Entities;
using SolTake.Domain.NotificationDomain.NotificationAggregate.Interfaces;
using SolTake.Core;

namespace SolTake.Application.DomainEventConsumers.CommentCreatedDomainEventConsumers.NotificationAggregate
{
    public class CreateCommentCreatedNotification(INotificationWriteRepository notificationWriteRepository, IUnitOfWork unitOfWork, IPublisher publisher) : IDomainEventConsumer<CommentCreatedDomainEvent>
    {
        private readonly INotificationWriteRepository _notificationWriteRepository = notificationWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IPublisher _publisher = publisher;

        public async Task Handle(CommentCreatedDomainEvent notification, CancellationToken cancellationToken)
        {
            Notification n;
            if (notification.Question != null)
            {
                if (notification.Question.UserId == notification.Comment.UserId) return;

                n = Notification.QuestionCommentCreatedNotification(
                    notification.Question.UserId,
                    notification.Comment.UserId,
                    notification.Login.UserName,
                    notification.Login.Image != null ? Multimedia.Clone(notification.Login.Image) : null,
                    notification.Question.Id,
                    notification.Question.Content?.Value,
                    notification.Question.Medias.FirstOrDefault() != null ? Multimedia.Clone(notification.Question.Medias.FirstOrDefault()!) : null,
                    notification.Comment.Id,
                    notification.Comment.Content.Value
                );
            }
            else if(notification.Solution != null)
            {
                if (notification.Solution.UserId == notification.Comment.UserId) return;

                n = Notification.SolutionCommentCreatedNotification(
                    notification.Solution.UserId,
                    notification.Comment.UserId,
                    notification.Login.UserName,
                    notification.Login.Image != null ? Multimedia.Clone(notification.Login.Image) : null,
                    notification.Solution.Id,
                    notification.Solution.Content?.Value,
                    notification.Solution.Medias.FirstOrDefault() != null ? Multimedia.Clone(notification.Solution.Medias.FirstOrDefault()!) : null,
                    notification.Comment.Id,
                    notification.Comment.Content.Value
                );
            }
            else if(notification.Replied != null)
            {
                if (notification.Replied.UserId == notification.Comment.UserId) return;

                n = Notification.CommentRepliedNotification(
                    notification.Replied.UserId,
                    notification.Comment.UserId,
                    notification.Login.UserName,
                    notification.Login.Image,
                    notification.Parent?.SolutionId,
                    notification.Parent?.QuestionId,
                    notification.Replied.Id,
                    notification.Replied.Content.Value,
                    notification.Comment.Id,
                    notification.Comment.Content.Value
                );
            }
            else return;

            await _notificationWriteRepository.CreateAsync(n, cancellationToken);
            await _unitOfWork.CommitAsync(cancellationToken);

            await _publisher.Publish(new NotificationCreatedDomainEvent(n), cancellationToken);
        }
    }
}
