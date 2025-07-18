﻿using SolTake.Application.InfrastructureServices;
using SolTake.Core;
using SolTake.Domain.MessageAggregate.DomainEvents;
using SolTake.Domain.MessageUserRemoveAggregate.Abstracts;

namespace SolTake.Application.DomainEventConsumers.MessageDeletedDomainEventConsumers.MessageUserRemoveAggregate
{
    public class DeleteMessageUserRemovers(IMessageUserRemoveWriteRepository messageUserRemoveWriteRepository, IUnitOfWork unitOfWork) : IDomainEventConsumer<MessageDeletedDomainEvent>
    {
        private readonly IMessageUserRemoveWriteRepository _messageUserRemoveWriteRepository = messageUserRemoveWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(MessageDeletedDomainEvent notification, CancellationToken cancellationToken)
        {
            var messageUserRemoves = await _messageUserRemoveWriteRepository.GetByMessageId(notification.Message.Id, cancellationToken);
            _messageUserRemoveWriteRepository.DeleteRange(messageUserRemoves);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
