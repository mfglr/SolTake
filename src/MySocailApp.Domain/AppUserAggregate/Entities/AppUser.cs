using MySocailApp.Core;
using MySocailApp.Domain.AccountAggregate.Entities;
using MySocailApp.Domain.AppUserAggregate.DomainEvents;
using MySocailApp.Domain.AppUserAggregate.Exceptions;
using MySocailApp.Domain.AppUserAggregate.ValueObjects;
using MySocailApp.Domain.CommentAggregate.Entities;
using MySocailApp.Domain.MessageAggregate.Entities;
using MySocailApp.Domain.NotificationAggregate.Entities;
using MySocailApp.Domain.QuestionAggregate.Entities;
using MySocailApp.Domain.SolutionAggregate.Entities;
using MySocailApp.Domain.UserConnectionAggregate.Entities;

namespace MySocailApp.Domain.AppUserAggregate.Entities
{
    public class AppUser(int id) : IPaginableAggregateRoot, IRemovable, IDomainEventsContainer
    {
        public int Id { get; private set; } = id;
        public DateTime? UpdatedAt { get; private set; }
        public DateTime CreatedAt { get; private set; }

        internal void Create()
        {
            HasImage = false;
            CreatedAt = DateTime.UtcNow;
        }

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

        internal void DeleteEntities()
        {
            _blockeds.Clear();
            _blockers.Clear();
            _followeds.Clear();
            _followers.Clear();
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
        public IReadOnlyList<Follow> Followers => _followers;
        public IReadOnlyList<Follow> Followeds => _followeds;
        public void Follow(int followerId)
        {
            if (followerId == Id)
                throw new UnableToFollowYourselfException();
            if (_followers.Any(x => x.FollowerId == followerId))
                throw new UserIsAlreadyFollowedException();

            _followers.Add(Entities.Follow.Create(followerId, Id));
            AddDomainEvent(new UserFollowedDomainEvent(followerId, Id));
        }
        public void Unfollow(int followerId)
        {
            var index = _followers.FindIndex(x => x.FollowerId == followerId);
            if (index == -1)
                throw new NoFollowException();
            _followers.RemoveAt(index);
        }
        public void RemoveFollower(int followerId)
        {
            var index = _followers.FindIndex(x => x.FollowerId == followerId);
            if (index == -1)
                throw new UserIsNotFollowerException();
            _followers.RemoveAt(index);
        }
        

        private readonly List<UserSearch> _searcheds = [];
        public IReadOnlyList<UserSearch> Searcheds => _searcheds;
        public IReadOnlyCollection<UserSearch> Searchers { get; }
        public void AddSearched(int searchedId)
        {
            var index = _searcheds.FindIndex(x => x.SearchedId == searchedId);
            if (index != -1)
                _searcheds.RemoveAt(index);
            _searcheds.Add(UserSearch.Create(searchedId));
        }
        public void RemoveSearched(int searchedId)
        {
            var index = _searcheds.FindIndex(x => x.SearchedId == searchedId);
            if (index == -1) return;
            _searcheds.RemoveAt(index);
        }

        //Block
        private readonly List<Block> _blockers = [];
        private readonly List<Block> _blockeds = [];
        public IReadOnlyList<Block> Blockers => _blockers;
        public IReadOnlyCollection<Block> Blockeds => _blockeds;
        public void Block(int userId)
        {
            if (Id == userId)
                throw new UnableToBlockYourself();

            if (_blockeds.Any(x => x.BlockedId == userId))
                throw new UserNotFoundException();

            if (_blockers.Any(x => x.BlockerId == userId))
                throw new UserIsAlreadyBlockedException();

            int index;

            index = _followers.FindIndex(x => x.FollowerId == userId);
            if (index >= 0)
                _followers.RemoveAt(index);

            index = _followeds.FindIndex(x => x.FollowedId == userId);
            if (index >= 0)
                _blockeds.RemoveAt(index);

            _blockers.Add(Entities.Block.Create(userId, Id));
        }
        public void Unblock(int userId)
        {
            var index = _blockers.FindIndex(x => x.BlockerId == userId);
            if (index < 0)
                throw new UserIsNotBlockedException();

            _blockers.RemoveAt(index);
        }


        //IRemovable
        public bool IsRemoved { get; private set; }
        public DateTime? RemovedAt { get; private set; }
        public void Remove()
        {
            IsRemoved = true;
            RemovedAt = DateTime.UtcNow;

            foreach (var item in _blockeds)
                item.Remove();
            foreach (var item in _blockers)
                item.Remove();
            foreach (var item in _followers)
                item.Remove();
            foreach (var item in _followeds)
                item.Remove();
        }
        public void Restore()
        {
            IsRemoved = false;
            RemovedAt = null;

            foreach (var item in _blockeds)
                item.Restore();
            foreach (var item in _blockers)
                item.Restore();
            foreach (var item in _followers)
                item.Restore();
            foreach (var item in _followeds)
                item.Restore();
        }

        //IDomainEventsContainer
        private readonly List<IDomainEvent> _events = [];
        public IReadOnlyList<IDomainEvent> Events => _events;
        public void AddDomainEvent(IDomainEvent domainEvent) => _events.Add(domainEvent);
        public void ClearEvents() => _events.Clear();

        //readonly navigator properties
        public Account Account { get; } = null!;
        public UserConnection UserConnection { get; } = null!;
        public IReadOnlyCollection<Question> Questions { get; } = null!;
        public IReadOnlyCollection<QuestionUserLike> QuestionsLiked { get; } = null!;
        public IReadOnlyCollection<Comment> Comments { get; } = null!;
        public IReadOnlyCollection<CommentUserLike> CommentsLiked { get; } = null!;
        public IReadOnlyCollection<CommentUserTag> CommentsTagged { get; } = null!;
        public IReadOnlyCollection<Solution> Solutions { get; } = null!;
        public IReadOnlyCollection<Message> Messages { get; } = null!;
        public IReadOnlyCollection<Message> MessagesReceived { get; } = null!;
    }
}
