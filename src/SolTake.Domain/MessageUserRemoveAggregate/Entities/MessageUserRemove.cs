﻿using SolTake.Core;
using SolTake.Domain.MessageUserRemoveAggregate.DomainEvents;

namespace SolTake.Domain.MessageUserRemoveAggregate.Entities
{
    public class MessageUserRemove : Entity, IAggregateRoot
    {
        public int MessageId { get; private set; }
        public int UserId { get; private set; }

        private MessageUserRemove(int messageId, int userId)
        {
            MessageId = messageId;
            UserId = userId;
        }
        public static MessageUserRemove Create(int messageId, int userId)
        {
            var messagUserRemove = new MessageUserRemove(messageId, userId) { CreatedAt = DateTime.UtcNow };
            messagUserRemove.AddDomainEvent(new MessageUserRemoveCreatedDomainEvent(messagUserRemove));
            return messagUserRemove;
        }
    }
}
