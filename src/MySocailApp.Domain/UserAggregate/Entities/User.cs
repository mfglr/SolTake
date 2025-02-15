using AccountDomain.AccountAggregate.Entities;
using AccountDomain.AccountAggregate.ValueObjects;
using MySocailApp.Core;
using MySocailApp.Domain.UserAggregate.DomainEvents;
using MySocailApp.Domain.UserAggregate.Exceptions;
using MySocailApp.Domain.UserAggregate.ValueObjects;

namespace MySocailApp.Domain.UserAggregate.Entities
{
    public class User : Account, IAggregateRoot
    {
        
        public User(Email email, Password password, Password passwordConfirm, Language language) :
            base(email, password, passwordConfirm, language){}
        
        public User(GoogleAccount googleAccount, Language language) :
            base(googleAccount, language) { }

        //profile image
        public Multimedia? Image { get; private set; }
        public void UpdateImage(Multimedia image)
        {
            if (Image != null)
                AddDomainEvent(new ProfileImageDeletedDomainEvent(Image));
            Image = image;
        }
        public void RemoveImage()
        {
            if (Image == null)
                throw new UserImageIsNotAvailableException();
            AddDomainEvent(new ProfileImageDeletedDomainEvent(Image));
            Image = null;
        }

        public string? Name { get; private set; }
        public void UpdateName(string name)
        {
            Name = name;
            UpdatedAt = DateTime.UtcNow;
        }
        public Biography? Biography { get; private set; }
        public void UpdateBiography(Biography biography)
        {
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

            AddDomainEvent(new UserUnfollowedDomainEvent(followerId, Id));
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
