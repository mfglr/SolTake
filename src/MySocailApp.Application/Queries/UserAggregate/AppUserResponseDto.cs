using MySocailApp.Domain.AppUserAggregate;

namespace MySocailApp.Application.Queries.UserAggregate
{
    public class AppUserResponseDto
    {
        public string Id { get; private set; }
        public DateTime CreatedAt { get; private set; }
        public DateTime? UpdatedAt { get; private set; }
        public string UserName { get; private set; }
        public string Name { get; private set; }
        public bool HasImage { get; private set; }
        public DateTime? BirthDate { get; private set; }
        public Gender Gender { get; private set; }
        public ProfileVisibility ProfileVisibility { get; private set; }
        public int NumberOfPosts { get; private set; }
        public int NumberOfFollowers { get; private set; }
        public int NumberOfFolloweds { get; private set; }
        public bool IsFollower { get; private set; }
        public bool IsFollowed { get; private set; }
        public bool IsRequester { get; private set; }
        public bool IsRequested { get; private set; }

        private AppUserResponseDto() { }

        public AppUserResponseDto(string id, DateTime createdAt, DateTime? updatedAt, string userName, string name, bool hasImage, DateTime? birthDate, Gender gender, ProfileVisibility profileVisibility, int numberOfPosts, int numberOfFollowers, int numberOfFolloweds, bool isFollower, bool isFollowed,bool isRequester,bool isRequested)
        {
            Id = id;
            CreatedAt = createdAt;
            UpdatedAt = updatedAt;
            UserName = userName;
            Name = name;
            HasImage = hasImage;
            BirthDate = birthDate;
            Gender = gender;
            ProfileVisibility = profileVisibility;
            NumberOfPosts = numberOfPosts;
            NumberOfFollowers = numberOfFollowers;
            NumberOfFolloweds = numberOfFolloweds;
            IsFollower = isFollower;
            IsFollowed = isFollowed;
            IsRequester = isRequester;
            IsRequested = isRequested;
        }
    }
}
