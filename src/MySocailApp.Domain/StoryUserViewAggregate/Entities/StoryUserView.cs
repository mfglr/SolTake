﻿using MySocailApp.Core;
using MySocailApp.Domain.StoryUserViewAggregate.DomainEvents;

namespace MySocailApp.Domain.StoryUserViewAggregate.Entities
{
    public class StoryUserView(int storyId, int userId) : Entity, IAggregateRoot
    {
        public int StoryId { get; private set; } = storyId;
        public int UserId { get; private set; } = userId;

        internal void Create()
        {
            CreatedAt = DateTime.UtcNow;
            AddDomainEvent(new StoryUserViewCreatedDomainEvent(this));
        }

    }
}
