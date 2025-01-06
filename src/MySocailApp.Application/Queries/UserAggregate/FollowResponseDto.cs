namespace MySocailApp.Application.Queries.UserAggregate
{
    public class FollowResponseDto
    {
        public int Id { get; private set; }
        public DateTime CreatedAt { get; private set; }
        public int FollowerId { get; private set; }
        public int FollowedId { get; private set; }
        public UserResponseDto? Follower { get; private set; }
        public UserResponseDto? Followed { get; private set; }

        public FollowResponseDto(int id, DateTime createdAt, int followerId, int followedId, UserResponseDto? follower, UserResponseDto? followed)
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
