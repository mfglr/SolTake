using MySocailApp.Core;
using MySocailApp.Domain.AppUserAggregate.Entities;

namespace MySocailApp.Domain.ConversationContext.ConversationAggregate.Entities
{
    public class Conversation : IAggregateRoot
    {
        public int UserId1 { get; private set; }
        public int UserId2 { get; private set; }
        public DateTime CreatedAt { get; private set; }
        public DateTime UpdatedAt { get; private set; }
        public DateTime DateOfLastCreatedMessage { get; private set; }

        internal void Create(int userId1, int userId2)
        {
            if (userId1 < userId2)
            {
                UserId1 = userId1;
                UserId2 = userId2;
            }
            else
            {
                UserId1 = userId2;
                UserId2 = userId1;
            }
            UpdatedAt = CreatedAt = DateTime.UtcNow;
        }
        internal void UpdateLastMessageDate() => DateOfLastCreatedMessage = DateTime.UtcNow;

        public static int[] GetId(int userId1,int userId2)
        {
            if (userId1 < userId2)
                return [userId1,userId2];
            return [userId2, userId1];
        }

        public AppUser AppUser1 { get; } = null!;
        public AppUser AppUser2 { get; } = null!;
    }
}
