﻿using SolTake.Domain.UserAggregate.Entities;
using SolTake.Core;

namespace SolTake.Domain.UserAggregate.DomainEvents
{
    public record UserNameUpdatedDomainEvent(User User) : IDomainEvent;
}