using MySocailApp.Core;

namespace MySocailApp.Domain.StoryDomain.StoryUserViewAggregate.Entities
{
    public class StoryUserView(int storyId, int userId) : Entity, IAggregateRoot
    {
        public int StoryId { get; private set; } = storyId;
        public int UserId { get; private set; } = userId;

        public void Create()
        {
            CreatedAt = DateTime.UtcNow;
        }

    }
}
