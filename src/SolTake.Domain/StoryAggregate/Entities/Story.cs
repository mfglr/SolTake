using SolTake.Domain.StoryAggregate.DomainEvents;
using SolTake.Domain.StoryAggregate.Exceptions;
using SolTake.Core;

namespace SolTake.Domain.StoryAggregate.Entities
{
    public class Story : Entity, IAggregateRoot
    {
        public static readonly int MaxDuration = 60;

        public int UserId { get; private set; }
        public Multimedia Media { get; private set; }

        private Story() { }

        public Story(int userId, Multimedia media)
        {
            if (media.MultimediaType == MultimediaType.Video && media.Duration >= MaxDuration)
                throw new StoryDurationExceedException();

            UserId = userId;
            Media = media;
        }

        public void Create()
        {
            CreatedAt = DateTime.UtcNow;
            AddDomainEvent(new StoryCreatedDomainEvent(this));
        }

        public bool IsActive => DateTime.UtcNow <= CreatedAt.AddDays(1);
    }
}
