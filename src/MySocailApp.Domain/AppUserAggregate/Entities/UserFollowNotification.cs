namespace MySocailApp.Domain.AppUserAggregate.Entities
{
    public class UserFollowNotification
    {
        public int AppUserId { get; private set; }
        public int FollowerId { get; private set; }
        public DateTime CreatedAt { get; private set; }

        private UserFollowNotification(int followerId) => FollowerId = followerId;
        public static UserFollowNotification Create(int followerId) => new (followerId) { CreatedAt = DateTime.UtcNow};
    }
}
