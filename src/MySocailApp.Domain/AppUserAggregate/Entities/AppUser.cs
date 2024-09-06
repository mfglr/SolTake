using MySocailApp.Core;
using MySocailApp.Domain.AccountAggregate.Entities;
using MySocailApp.Domain.AppUserAggregate.DomainEvents;
using MySocailApp.Domain.AppUserAggregate.Exceptions;
using MySocailApp.Domain.AppUserAggregate.ValueObjects;
using MySocailApp.Domain.CommentAggregate.Entities;
using MySocailApp.Domain.MessageAggregate.Entities;
using MySocailApp.Domain.NotificationConnectionAggregate.Entities;
using MySocailApp.Domain.QuestionAggregate.Entities;
using MySocailApp.Domain.SolutionAggregate.Entities;
using MySocailApp.Domain.UserConnectionAggregate.Entities;

namespace MySocailApp.Domain.AppUserAggregate.Entities
{
    public class AppUser(int id) : Entity(id), IAggregateRoot
    {
        internal void Create() => CreatedAt = DateTime.UtcNow;

        public bool HasImage { get; private set; }
        public ProfileImage? Image { get; private set; }
        private readonly List<AppUserImage> _images = [];
        public IReadOnlyCollection<AppUserImage> Images => _images;
        public void UpdateImage(ProfileImage image)
        {
            if (Image != null)
                _images.Add(Image.ToAppUserImage());
            HasImage = true;
            Image = image;
        }
        public void RemoveImage()
        {
            if (Image == null)
                throw new UserImageIsNotAvailableException();
            HasImage = false;
            _images.Add(Image.ToAppUserImage());
            Image = null;
        }

        public string? Name { get; private set; }
        public void UpdateName(string name)
        {
            if (name == "")
                Name = null;
            else
                Name = name;
            UpdatedAt = DateTime.UtcNow;
        }
        public Gender Gender { get; private set; }
        public void UpdateGender(Gender gender)
        {
            Gender = gender;
            UpdatedAt = DateTime.UtcNow;
        }
        public DateTime? BirthDate { get; private set; }
        public void UpdateBirthDate(DateTime birthDate)
        {
            if (birthDate >= DateTime.UtcNow)
                throw new InvalidBirthDateException();

            BirthDate = birthDate;
            UpdatedAt = DateTime.UtcNow;
        }

        //following
        private readonly List<Follow> _followers = [];
        private readonly List<Follow> _followeds = [];
        private readonly List<UserFollowNotification> _userFollowNotifications = [];
        public IReadOnlyList<Follow> Followers => _followers;
        public IReadOnlyList<Follow> Followeds => _followeds;
        public IReadOnlyCollection<UserFollowNotification> UserFollowNotifications => _userFollowNotifications;
        public Follow Follow(int followerId)
        {
            if (followerId == Id)
                throw new UnableToFollowYourselfException();
            if (_followers.Any(x => x.FollowerId == followerId))
                throw new UserIsAlreadyFollowedException();

            var follow = Entities.Follow.Create(followerId, Id);
            _followers.Add(follow);

            var notification = _userFollowNotifications.FirstOrDefault(x => x.FollowerId == followerId);
            if (notification == null || DateTime.UtcNow >= notification.CreatedAt.AddDays(1))
            {
                if (notification != null) _userFollowNotifications.Remove(notification);
                _userFollowNotifications.Add(UserFollowNotification.Create(followerId));
                AddDomainEvent(new UserFollowedDomainEvent(follow));
            }
            return follow;
        }
        public void Unfollow(int followerId)
        {
            var index = _followers.FindIndex(x => x.FollowerId == followerId);
            if (index == -1)
                throw new NoFollowException();
            _followers.RemoveAt(index);
            AddDomainEvent(new UserUnfollowedDomainEvent(followerId,Id));
        }
        public void RemoveFollower(int followerId)
        {
            var index = _followers.FindIndex(x => x.FollowerId == followerId);
            if (index == -1) return;
            _followers.RemoveAt(index);
        }

        private readonly List<UserSearch> _searcheds = [];
        public IReadOnlyList<UserSearch> Searcheds => _searcheds;
        public IReadOnlyCollection<UserSearch> Searchers { get; } = null!;
        public UserSearch AddSearched(int searchedId)
        {
            var index = _searcheds.FindIndex(x => x.SearchedId == searchedId);
            if (index != -1)
                _searcheds.RemoveAt(index);
            var search = UserSearch.Create(searchedId);
            _searcheds.Add(search);
            return search;
        }
        public void RemoveSearched(int searchedId)
        {
            var index = _searcheds.FindIndex(x => x.SearchedId == searchedId);
            if (index == -1) return;
            _searcheds.RemoveAt(index);
        }

        //readonly navigator properties
        public Account Account { get; } = null!;
        public UserConnection UserConnection { get; } = null!;
        public NotificationConnection NotificationConnection { get; } = null!;
        public IReadOnlyCollection<Question> Questions { get; } = null!;
        public IReadOnlyCollection<QuestionUserLike> QuestionsLiked { get; } = null!;
        public IReadOnlyCollection<Comment> Comments { get; } = null!;
        public IReadOnlyCollection<CommentUserLike> CommentsLiked { get; } = null!;
        public IReadOnlyCollection<CommentUserTag> CommentsTagged { get; } = null!;
        public IReadOnlyCollection<Solution> Solutions { get; } = null!;
        public IReadOnlyCollection<Message> Messages { get; } = null!;
        public IReadOnlyCollection<Message> MessagesReceived { get; } = null!;
        public IReadOnlyCollection<SolutionUserVote> Votes { get; } = null!;
    }
}
