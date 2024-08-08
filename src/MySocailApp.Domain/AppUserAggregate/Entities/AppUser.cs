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

        public UserImage? Image { get; private set; }
        private readonly List<AppUserImage> _images = [];
        public IReadOnlyCollection<AppUserImage> Images => _images;
        internal void UpdateImage(UserImage image)
        {
            if (Image != null)
                _images.Add(Image.ToAppUserImage());
            Image = image;
        }
        public void RemoveImage()
        {
            if (Image == null)
                throw new UserImageIsNotAvailableException();
            _images.Add(Image.ToAppUserImage());
            Image = null;
        }

        internal void Create()
        {
            ProfileVisibility = ProfileVisibility.Public;
            CreatedAt = DateTime.UtcNow;
        }

        internal void DeleteEntities()
        {
            _blockeds.Clear();
            _blockers.Clear();
            _followeds.Clear();
            _followers.Clear();
            _requesters.Clear();
            _requesteds.Clear();
        }

        public string? Name { get; private set; }
        public void UpdateName(string name)
        {
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

        //profile visibility
        public ProfileVisibility ProfileVisibility { get; private set; }
        public void MakeProfilePrivate()
        {
            if (ProfileVisibility == ProfileVisibility.Private)
                throw new ProfileIsAlreadyPrivateException();

            UpdatedAt = DateTime.UtcNow;
            ProfileVisibility = ProfileVisibility.Private;
        }
        public void MakeProfilePublic()
        {
            if (ProfileVisibility == ProfileVisibility.Public)
                throw new ProfileIsAlreadyPublicException();

            UpdatedAt = DateTime.UtcNow;
            ProfileVisibility = ProfileVisibility.Public;

            //Accept all follow requests
            foreach (var followRequest in _requesters)
                _followers.Add(Follow.Create(followRequest.RequesterId, Id));
            _requesters.Clear();
        }

        //following
        private readonly List<Follow> _followers = [];
        private readonly List<Follow> _followeds = [];
        private readonly List<FollowRequest> _requesters = [];
        private readonly List<FollowRequest> _requesteds = [];
        public IReadOnlyList<Follow> Followers => _followers;
        public IReadOnlyList<Follow> Followeds => _followeds;
        public IReadOnlyList<FollowRequest> Requesters => _requesters;
        public IReadOnlyList<FollowRequest> Requesteds => _requesteds;
        public void MakeFollowRequest(int requesterId)
        {
            if (requesterId == Id)
                throw new UnableToFollowYourselfException();

            if (_blockeds.Any(x => x.BlockedId == requesterId))
                throw new UserIsNotFoundException();

            if (_blockers.Any(x => x.BlockerId == requesterId))
                throw new UserIsBlockedException();

            if (_followers.Any(x => x.FollowerId == requesterId))
                throw new UserIsAlreadyFollowedException();

            if (_requesters.Any(x => x.RequesterId == requesterId))
                throw new FollowRequestAlreadyExistException();

            if (ProfileVisibility == ProfileVisibility.Private)
            {
                _requesters.Add(FollowRequest.Create(requesterId, Id));
                AddDomainEvent(new FollowRequestCreatedEvent(requesterId, Id));
            }
            else
            {
                _followers.Add(Follow.Create(requesterId, Id));
                AddDomainEvent(new FollowCreatedEvent(requesterId, Id));
            }
        }
        public void CancelFollowRequest(int requesterId)
        {
            var index = _requesters.FindIndex(x => x.RequesterId == requesterId);
            if (index != -1)
            {
                _requesters.RemoveAt(index);
                return;
            }
            index = _followers.FindIndex(x => x.FollowerId == requesterId);
            if (index == -1)
                throw new NoFollowRequestOrFollowException();
            _followers.RemoveAt(index);
        }
        public void RemoveFollower(int followerId)
        {
            var index = _followers.FindIndex(x => x.FollowerId == followerId);
            if (index == -1)
                throw new UserIsNotFollowerException();
            _followers.RemoveAt(index);
        }
        public void AcceptFollowRequest(int requesterId)
        {
            var index = _requesters.FindIndex(x => x.RequesterId == requesterId);
            if (index == -1)
                throw new FollowRequestIsNotFoundException();
            _requesters.RemoveAt(index);
            _followers.Add(Follow.Create(requesterId, Id));
            AddDomainEvent(new FollowCreatedEvent(requesterId, Id));
        }
        public void RejectFollowRequest(int requesterId)
        {
            var index = _requesters.FindIndex(x => x.RequesterId == requesterId);
            if (index == -1)
                throw new FollowRequestIsNotFoundException();
            _requesters.RemoveAt(index);
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
                throw new UserIsNotFoundException();

            if (_blockers.Any(x => x.BlockerId == userId))
                throw new UserIsAlreadyBlockedException();

            int index;

            index = _followers.FindIndex(x => x.FollowerId == userId);
            if (index >= 0)
                _followers.RemoveAt(index);

            index = _followeds.FindIndex(x => x.FollowedId == userId);
            if (index >= 0)
                _blockeds.RemoveAt(index);

            index = _requesters.FindIndex(x => x.RequesterId == userId);
            if (index >= 0)
                _requesters.RemoveAt(index);

            index = _requesteds.FindIndex(x => x.RequestedId == userId);
            if (index >= 0)
                _requesteds.RemoveAt(index);

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
            foreach (var item in _requesters)
                item.Remove();
            foreach (var item in _requesteds)
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
            foreach (var item in _requesters)
                item.Restore();
            foreach (var item in _requesteds)
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
        public IReadOnlyCollection<Solution> Solutions { get; } = null!;
        public IReadOnlyCollection<Comment> Comments { get; } = null!;
        public IReadOnlyCollection<CommentUserLike> CommentsLiked { get; } = null!;
        public IReadOnlyCollection<CommentUserTag> CommentsTagged { get; } = null!;
        public IReadOnlyCollection<Notification> Noitifications { get; } = null!;
        public IReadOnlyCollection<Message> Messages { get; } = null!;
        public IReadOnlyCollection<Message> MessagesReceived { get; } = null!;
    }
}
