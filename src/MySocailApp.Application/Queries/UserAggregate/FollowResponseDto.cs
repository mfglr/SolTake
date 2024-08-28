namespace MySocailApp.Application.Queries.UserAggregate
{
    public class FollowResponseDto
    {
        public int Id { get; private set; }
        public DateTime CreatedAt { get; private set; }
        public int FollowerId { get; private set; }
        public int FollowedId { get; private set; }
        public AppUserResponseDto? Follower { get; private set; }
        public AppUserResponseDto? Followed { get; private set; }

        public FollowResponseDto(int id, DateTime createdAt, int followerId, int followedId, AppUserResponseDto? follower, AppUserResponseDto? followed)
        {
            Id = id;
            CreatedAt = createdAt;
            FollowerId = followerId;
            FollowedId = followedId;
            Follower = follower;
            Followed = followed;
        }

        private FollowResponseDto() { }
    }
}
