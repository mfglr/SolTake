﻿using MySocailApp.Core;
using MySocailApp.Domain.UserDomain.UserAggregate.Entities;

namespace MySocailApp.Domain.UserDomain.UserAggregate.DomainEvents
{
    public record EmailVerificationTokenUpdatedDomainEvent(User User) : IDomainEvent;
}
