﻿using MySocailApp.Core;
using MySocailApp.Domain.NotificationDomain.NotificationAggregate.Entities;

namespace MySocailApp.Domain.NotificationDomain.NotificationAggregate.DomainEvents
{
    public record SolutionUpvotedNotificationCreatedDomainEvent(Notification Notification, int VoteId) : IDomainEvent;
}
