﻿using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Core;
using MySocailApp.Domain.AppUserAggregate.DomainEvents;
using MySocailApp.Domain.CommentAggregate.Abstracts;

namespace MySocailApp.Application.DomainEventConsumers.UserDeletedDomainEventConsumers.CommentAggregate
{
    public class DeleteCommentUserTags(ICommentWriteRepository commentWriteRepository, IUnitOfWork unitOfWork) : IDomainEventConsumer<UserDeletedDomainEvent>
    {
        private readonly ICommentWriteRepository _commentWriteRepository = commentWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(UserDeletedDomainEvent notification, CancellationToken cancellationToken)
        {
            await _commentWriteRepository.RemoveCommentUserTagsByUserId(notification.User.Id,cancellationToken);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
