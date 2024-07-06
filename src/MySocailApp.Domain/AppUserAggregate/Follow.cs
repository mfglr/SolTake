using MySocailApp.Core;

namespace MySocailApp.Domain.AppUserAggregate
{
    public class Follow : IRemovable
    {
        public string FollowerId { get; private set; }
        public AppUser Follower { get; } = null!;
        public string FollowedId { get; private set; }
        public AppUser Followed { get; } = null!;
        public DateTime CreatedAt { get; private set; }

        private Follow(string followerId, string followedId)
        {
            FollowerId = followerId;
            FollowedId = followedId;
        }

        public static Follow Create(string followerId, string followedId)
        {
            var r = new Follow(followerId, followedId)
            {
                CreatedAt = DateTime.UtcNow
            };
            return r;
        }


        //IRemovable
        //A follow should only be removed when the user deactivates its account.
        public bool IsRemoved { get; private set; }
        public DateTime? RemovedAt { get; private set; }
        public void Remove()
        {
            IsRemoved = true;
            RemovedAt = DateTime.UtcNow;
        }
        public void Restore()
        {
            IsRemoved = false;
            RemovedAt = null;
        }
    }
}
