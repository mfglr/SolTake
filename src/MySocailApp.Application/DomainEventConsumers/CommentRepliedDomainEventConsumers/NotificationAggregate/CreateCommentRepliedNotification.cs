﻿using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Core;
using MySocailApp.Domain.CommentDomain.CommentAggregate.DomainEvents;
using MySocailApp.Domain.NotificationDomain.NotificationAggregate.DomainEvents;
using MySocailApp.Domain.NotificationDomain.NotificationAggregate.Entities;
using MySocailApp.Domain.NotificationDomain.NotificationAggregate.Interfaces;

namespace MySocailApp.Application.DomainEventConsumers.CommentRepliedDomainEventConsumers.NotificationAggregate
{
    public class CreateCommentRepliedNotification(INotificationWriteRepository notificationWriteRepository, IUnitOfWork unitOfWork, IPublisher publisher) : IDomainEventConsumer<CommentRepliedDomainEvent>
    {
        private readonly INotificationWriteRepository _notificationWriteRepository = notificationWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IPublisher _publisher = publisher;

        public async Task Handle(CommentRepliedDomainEvent notification, CancellationToken cancellationToken)
        {
            var comment = notification.Comment;
            var repliedComment = notification.RepliedComment;
            var parentComment = notification.ParentComment;

            var n = Notification.CommentRepliedNotification(repliedComment.UserId, comment.UserId, comment.Id, parentComment.QuestionId, parentComment.SolutionId, parentComment.Id, repliedComment.Id);
            await _notificationWriteRepository.CreateAsync(n, cancellationToken);
            await _unitOfWork.CommitAsync(cancellationToken);

            await _publisher.Publish(new CommentRepliedNotificationCreatedDomainEvent(n), cancellationToken);
        }

    }
}
