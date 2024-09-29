using MySocailApp.Core;
using MySocailApp.Domain.AppUserAggregate.Entities;
using MySocailApp.Domain.MessageAggregate.DomainEvents;
using MySocailApp.Domain.MessageAggregate.Exceptions;

namespace MySocailApp.Domain.MessageAggregate.Entities
{
    public class Message : Entity, IAggregateRoot
    {
        public bool IsEdited { get; private set; }
        public int SenderId { get; private set; }
        public int ReceiverId { get; private set; }
        public string? Content { get; private set; }
        private readonly List<MessageImage> _images = [];
        public IReadOnlyList<MessageImage> Images => _images;

        private Message() { }
        public Message(int senderId,string? content, IEnumerable<MessageImage>? images)
        {
            if (string.IsNullOrEmpty(content) && (images == null || !images.Any()))
                throw new ContentRequiredException();
            SenderId = senderId;
            Content = content;
            if (images != null)
                _images.AddRange(images);
        }
        public void Create(int receiverId)
        {
            if (SenderId == receiverId)
                throw new SelfMessagingException();
            ReceiverId = receiverId;
            UpdatedAt = CreatedAt = DateTime.UtcNow;
            AddDomainEvent(new MessageCreatedDomainEvent(this));
        }

        private readonly List<MessageUserReceive> _receivers = [];
        private readonly List<MessageUserView> _viewers = [];
        public IReadOnlyCollection<MessageUserView> Viewers => _viewers;
        public IReadOnlyCollection<MessageUserReceive> Receivers => _receivers;
        public void MarkAsReceived(int receiverId)
        {
            if (receiverId != ReceiverId)
                throw new PermissionDeniedToChangeStateOfMessageException();
            if (_receivers.Any(x => x.AppUserId == receiverId))
                throw new MessageAlreadyMarktedAsReceivedException();
            _receivers.Add(MessageUserReceive.Create(receiverId));
            AddDomainEvent(new MessageMarkedAsReceivedDomainEvent(this));
        }
        public void MarkAsViewed(int viewerId)
        {
            if (viewerId != ReceiverId)
                throw new PermissionDeniedToChangeStateOfMessageException();
            if (_viewers.Any(x => x.AppUserId == viewerId))
                throw new MessageAlreadyMarkedAsViewedException();
            _viewers.Add(MessageUserView.Create(viewerId));
            AddDomainEvent(new MessageMarkedAsViewedDomainEvent(this));
        }
        public int State => _viewers.Any() ? 2 : _receivers.Any() ? 1 : 0;

        private readonly List<MessageUserRemove> _removers = [];
        public IReadOnlyList<MessageUserRemove> Removers => _removers;
        internal void Remove(int removerId)
        {
            if (removerId != ReceiverId && removerId != SenderId)
                throw new PermissionDeniedToRemoveMessageException();
            
            if (_removers.Any(x => x.AppUserId == removerId))
                return;

            _removers.Add(new MessageUserRemove(removerId));
        }

        //readonly navigators
        public AppUser Sender { get; } = null!;
        public AppUser Receiver { get; } = null!;
    }
}
