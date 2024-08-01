using MySocailApp.Core;
using MySocailApp.Domain.AppUserAggregate.Entities;
using MySocailApp.Domain.ConversationAggregate.Entities;
using MySocailApp.Domain.MessageAggregate.DomainEvents;
using MySocailApp.Domain.MessageAggregate.Exceptions;

namespace MySocailApp.Domain.MessageAggregate.Entities
{
    public class Message : IPaginableAggregateRoot, IDomainEventsContainer
    {
        public int Id { get; private set; }
        public DateTime CreatedAt { get; private set; }
        public DateTime UpdatedAt { get; private set; }
        public bool IsEdited { get; private set; }
        public int ConversationId { get; private set; }
        public int OwnerId { get; private set; }
        public string? Content { get; private set; }
        private readonly List<MessageImage> _images = [];
        public IReadOnlyCollection<MessageImage> Images => _images;

        private Message() { }

        public Message(int ownerId, string? content, IEnumerable<MessageImage>? images)
        {
            if (string.IsNullOrEmpty(content) && (images == null || !images.Any()))
                throw new ContentRequiredException();
            OwnerId = ownerId;
            Content = content;
            if (images != null)
                _images.AddRange(images);
        }

        internal void Create(int conversationId, int receiverId)
        {
            ConversationId = conversationId;
            CreatedAt = UpdatedAt = DateTime.UtcNow;
            AddDomainEvent(new MessageCreatedDomainEvent(this, receiverId));
        }

        private readonly List<MessageUserReceive> _receivers = [];
        private readonly List<MessageUserView> _viewers = [];
        public IReadOnlyCollection<MessageUserView> Viewers => _viewers;
        public IReadOnlyCollection<MessageUserReceive> Receivers => _receivers;
        internal void AddReceiver(int receiverId)
        {
            if (receiverId == OwnerId)
                throw new PermissionDeniedToChangeStateOfMessageException();

            if (_receivers.Any(x => x.AppUserId == receiverId))
                throw new MessageAlreadyMarktedAsReceivedException();

            _receivers.Add(MessageUserReceive.Create(receiverId));
        }
        internal void AddViewer(int viewerId)
        {
            if (viewerId == OwnerId)
                throw new PermissionDeniedToChangeStateOfMessageException();

            if (_viewers.Any(x => x.AppUserId == viewerId))
                throw new MessageAlreadyMarkedAsViewedException();

            _viewers.Add(MessageUserView.Create(viewerId));
        }


        public int State()
        {
            var numberOfUsersExceptOwner = Conversation.Users.Count - 1;
            if (numberOfUsersExceptOwner == _viewers.Count)
                return 2;
            if (numberOfUsersExceptOwner == _receivers.Count)
                return 1;
            return 0;
        }

        //readonly navigators
        public Conversation Conversation { get; } = null!;
        public AppUser Owner { get; } = null!;

        //IDomainEventContainer
        private readonly List<IDomainEvent> _events = [];
        public IReadOnlyList<IDomainEvent> Events => _events;
        public void AddDomainEvent(IDomainEvent domainEvent) => _events.Add(domainEvent);
        public void ClearEvents() => _events.Clear();
    }
}
