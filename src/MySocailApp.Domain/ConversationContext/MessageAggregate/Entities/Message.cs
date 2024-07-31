using MySocailApp.Core;
using MySocailApp.Domain.AppUserAggregate.Entities;
using MySocailApp.Domain.ConversationContext.MessageAggregate.DomainEvents;
using MySocailApp.Domain.ConversationContext.MessageAggregate.Exceptions;

namespace MySocailApp.Domain.ConversationContext.MessageAggregate.Entities
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
        public byte[] RowVersion { get; private set; }
        private readonly List<MessageImage> _images = [];
        public IReadOnlyCollection<MessageImage> Images => _images;

        private Message() { }

        public Message(int senderId, int receiverId, string? content, IEnumerable<MessageImage>? images)
        {
            if (senderId == receiverId)
                throw new SelfMessagingException();
            if (string.IsNullOrEmpty(content) && (images == null || !images.Any()))
                throw new ContentRequiredException();

            if (images != null)
                _images.AddRange(images);
            SenderId = senderId;
            ReceiverId = receiverId;
            Content = content;
        }

        internal void Create()
        {
            CreatedAt = UpdatedAt = DateTime.UtcNow;
            AddDomainEvent(new MessageCreatedDomainEvent(this));
        }

        private readonly List<MessageUserReceipts> _receipts = [];
        private readonly List<MessageUserViews> _views = [];
        public IReadOnlyCollection<MessageUserViews> Views => _views;
        public IReadOnlyCollection<MessageUserReceipts> Receipts => _receipts;
        public void MarkAsReceipted(int recipientId)
        {
            if(recipientId != ReceiverId)
                throw new PermissionDeniedToChangeStateOfMessageException();
            if (_receipts.Any())
                return;

            _receipts.Add(MessageUserReceipts.Create(recipientId));
            AddDomainEvent(new MessageMarkedAsReceiptedDomainEvent(this));
        }
        public void MarkAsViewed(int viewerId)
        {
            if (viewerId != ReceiverId)
                throw new PermissionDeniedToChangeStateOfMessageException();
            if (_views.Any())
                return;

            _views.Add(MessageUserViews.Create(viewerId));
            AddDomainEvent(new MessageMarkedAsReceiptedDomainEvent(this));
        }
        public int State()
        {
            if (_views.Any())
                return 2;
            if(_receipts.Any())
                return 1;
            return 0;
        }

        public DateTime? ReceiptedAt => _receipts.FirstOrDefault()?.CreatedAt;
        public DateTime? ViewedAt => _views.FirstOrDefault()?.CreatedAt;

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
