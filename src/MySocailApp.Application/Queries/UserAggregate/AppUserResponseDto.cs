using MySocailApp.Domain.AppUserAggregate.ValueObjects;

namespace MySocailApp.Application.Queries.UserAggregate
{
    public class AppUserResponseDto
    {
        public int Id { get; private set; }
        public DateTime CreatedAt { get; private set; }
        public DateTime? UpdatedAt { get; private set; }
        public string UserName { get; private set; } = null!;
        public string? Name { get; private set; }
        public DateTime? BirthDate { get; private set; }
        public Gender Gender { get; private set; }
        public bool HasImage { get; private set; }
        public int NumberOfQuestions { get; private set; }
        public int NumberOfFollowers { get; private set; }
        public int NumberOfFolloweds { get; private set; }
        public bool IsFollower { get; private set; }
        public bool IsFollowed { get; private set; }
        public int LikeId { get; private set; }

        public AppUserResponseDto(int id, DateTime createdAt, DateTime? updatedAt, string userName, string? name, DateTime? birthDate, Gender gender, bool hasImage, int numberOfQuestions, int numberOfFollowers, int numberOfFolloweds, bool isFollower, bool isFollowed, int likeId)
        {
            Id = id;
            CreatedAt = createdAt;
            UpdatedAt = updatedAt;
            UserName = userName;
            Name = name;
            BirthDate = birthDate;
            Gender = gender;
            HasImage = hasImage;
            NumberOfQuestions = numberOfQuestions;
            NumberOfFollowers = numberOfFollowers;
            NumberOfFolloweds = numberOfFolloweds;
            IsFollower = isFollower;
            IsFollowed = isFollowed;
            LikeId = likeId;
        }

        private AppUserResponseDto() { }


    }
}
