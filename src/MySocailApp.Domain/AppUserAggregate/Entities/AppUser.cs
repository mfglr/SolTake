using MySocailApp.Core;
using MySocailApp.Domain.AppUserAggregate.DomainEvents;
using MySocailApp.Domain.AppUserAggregate.Exceptions;
using MySocailApp.Domain.AppUserAggregate.ValueObjects;

namespace MySocailApp.Domain.AppUserAggregate.Entities
{
    public class AppUser : Entity, IAggregateRoot
    {
        internal AppUser(int id) : base(id) { }
        internal void Create()
        {
            Name = "";
            Biography = new Biography("");
            HasImage = false;
            CreatedAt = DateTime.UtcNow;
        }
        public bool HasImage { get; private set; }
        public ProfileImage? Image { get; private set; }
        public void UpdateImage(ProfileImage image)
        {
            if (Image != null) AddDomainEvent(new ProfileImageDeletedDomainEvent(Image));
            HasImage = true;
            Image = image;
        }
        public void RemoveImage()
        {
            if (Image == null)
                throw new UserImageIsNotAvailableException();
            AddDomainEvent(new ProfileImageDeletedDomainEvent(Image));
            HasImage = false;
            Image = null;
        }
        public string Name { get; private set; }
        public void UpdateName(string name)
        {
            Name = name ?? throw new NameRequiredException();
            UpdatedAt = DateTime.UtcNow;
        }
        public Biography Biography { get; private set; }
        public void UpdateBiography(Biography biography)
        {
            ArgumentNullException.ThrowIfNull(biography);
            Biography = biography;
            UpdatedAt = DateTime.UtcNow;
        }

        //following
        private readonly List<Follow> _followers = [];
        public IReadOnlyList<Follow> Followers => _followers;
        private readonly List<UserFollowNotification> _userFollowNotifications = [];
        public IReadOnlyCollection<UserFollowNotification> UserFollowNotifications => _userFollowNotifications;
        public Follow Follow(int followerId)
        {
            if (followerId == Id)
                throw new PermissionDeniedToFollowYourselfException();
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
            if (index == -1) return;
            _followers.RemoveAt(index);

            AddDomainEvent(new UserUnfollowedDomainEvent(followerId,Id));
        }
        public void RemoveFollower(int followerId)
        {
            var index = _followers.FindIndex(x => x.FollowerId == followerId);
            if (index == -1) return;
            _followers.RemoveAt(index);
        }

        //searchings
        private readonly List<UserSearch> _searchers = [];
        public IReadOnlyCollection<UserSearch> Searchers => _searchers;
        public UserSearch AddSearcher(int searcherId)
        {
            var index = _searchers.FindIndex(x => x.SearcherId == searcherId);
            if (index != -1)
                _searchers.RemoveAt(index);
            var search = UserSearch.Create(searcherId);
            _searchers.Add(search);
            return search;
        }
        public void RemoveSearcher(int searcherId)
        {
            var index = _searchers.FindIndex(x => x.SearcherId == searcherId);
            if (index == -1) return;
            _searchers.RemoveAt(index);
        }
    }
}
