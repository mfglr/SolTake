﻿using SolTake.Domain.NotificationDomain.NotificationAggregate.Entities;
using SolTake.Core;

namespace SolTake.Domain.NotificationDomain.NotificationAggregate.DomainEvents
{
    public record CommentRepliedNotificationCreatedDomainEvent(Notification Notification) : IDomainEvent;
}
