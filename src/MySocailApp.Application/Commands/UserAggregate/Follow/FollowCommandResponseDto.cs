namespace MySocailApp.Application.Commands.UserAggregate.Follow
{
    public class FollowCommandResponseDto
    {
        public int Id { get; private set; }
        public DateTime CreatedAt { get; private set; }
        public int FollowerId { get; private set; }
        public int FollowedId { get; private set; }

        private FollowCommandResponseDto() { }
    }
}
