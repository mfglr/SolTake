namespace MySocailApp.Domain.UserDomain.UserAggregate.Entities
{
    public class UserFollowNotification
    {
        public int UserId { get; private set; }
        public int FollowerId { get; private set; }
        public DateTime CreatedAt { get; private set; }

        private UserFollowNotification(int followerId) => FollowerId = followerId;
        public static UserFollowNotification Create(int followerId) => new(followerId) { CreatedAt = DateTime.UtcNow };
    }
}
