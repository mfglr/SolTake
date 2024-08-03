using MySocailApp.Core;
using MySocailApp.Domain.AppUserAggregate.Entities;
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
        public int SenderId { get; private set; }
        public int ReceiverId { get; private set; }
        public string? Content { get; private set; }
        private readonly List<MessageImage> _images = [];
        public IReadOnlyCollection<MessageImage> Images => _images;

        private Message() { }
        public Message(int senderId,int receiverId, string? content, IEnumerable<MessageImage>? images)
        {
            if (senderId == receiverId)
                throw new SelfMessagingException();
            if (string.IsNullOrEmpty(content) && (images == null || !images.Any()))
                throw new ContentRequiredException();
            SenderId = senderId;
            ReceiverId = receiverId;
            Content = content;
            if (images != null)
                _images.AddRange(images);
        }
        public void Create()
        {
            CreatedAt = UpdatedAt = DateTime.UtcNow;
            AddDomainEvent(new MessageCreatedDomainEvent(this));
        }

        private readonly List<MessageUserReceive> _receivers = [];
        private readonly List<MessageUserView> _viewers = [];
        public IReadOnlyCollection<MessageUserView> Viewers => _viewers;
        public IReadOnlyCollection<MessageUserReceive> Receivers => _receivers;
        public void AddReceiver(int receiverId)
        {
            if (receiverId != ReceiverId)
                throw new PermissionDeniedToChangeStateOfMessageException();
            if (_receivers.Any(x => x.AppUserId == receiverId))
                throw new MessageAlreadyMarktedAsReceivedException();
            _receivers.Add(MessageUserReceive.Create(receiverId));
            AddDomainEvent(new AddedReceiverDomainEvent(this));
        }
        public void AddViewer(int viewerId)
        {
            if (viewerId != ReceiverId)
                throw new PermissionDeniedToChangeStateOfMessageException();
            if (_viewers.Any(x => x.AppUserId == viewerId))
                throw new MessageAlreadyMarkedAsViewedException();
            _viewers.Add(MessageUserView.Create(viewerId));
            AddDomainEvent(new AddViewerDomainEvent(this));
        }
        public int State => _viewers.Any() ? 2 : _receivers.Any() ? 1 : 0;

        //readonly navigators
        public AppUser Sender { get; } = null!;
        public AppUser Receiver { get; } = null!;

        //IDomainEventContainer
        private readonly List<IDomainEvent> _events = [];
        public IReadOnlyList<IDomainEvent> Events => _events;
        public void AddDomainEvent(IDomainEvent domainEvent) => _events.Add(domainEvent);
        public void ClearEvents() => _events.Clear();
    }
}
