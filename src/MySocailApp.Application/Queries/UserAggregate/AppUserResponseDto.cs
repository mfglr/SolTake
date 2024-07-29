using MySocailApp.Domain.AppUserAggregate.ValueObjects;

namespace MySocailApp.Application.Queries.UserAggregate
{
    public class AppUserResponseDto
    {
        public int Id { get; private set; }
        public DateTime CreatedAt { get; private set; }
        public DateTime? UpdatedAt { get; private set; }
        public string UserName { get; private set; }
        public string Name { get; private set; }
        public DateTime? BirthDate { get; private set; }
        public Gender Gender { get; private set; }
        public ProfileVisibility ProfileVisibility { get; private set; }
        public int NumberOfQuestions { get; private set; }
        public int NumberOfFollowers { get; private set; }
        public int NumberOfFolloweds { get; private set; }
        public bool IsFollower { get; private set; }
        public bool IsFollowed { get; private set; }
        public bool IsRequester { get; private set; }
        public bool IsRequested { get; private set; }
        public int NumberOfUnviewedNotifications { get; private set; }

        private AppUserResponseDto() { }
    }
}
