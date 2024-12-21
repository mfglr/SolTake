using MySocailApp.Core;
using MySocailApp.Domain.MessageDomain.MessageAggregate.DomainEvents;
using MySocailApp.Domain.MessageDomain.MessageAggregate.Exceptions;
using MySocailApp.Domain.MessageDomain.MessageAggregate.ValueObjects;

namespace MySocailApp.Domain.MessageDomain.MessageAggregate.Entities
{
    public class Message : Entity, IAggregateRoot
    {
        public readonly static int MaxNumberOfMessageImage = 2;

        public bool IsEdited { get; private set; }
        public int SenderId { get; private set; }
        public int ReceiverId { get; private set; }
        public MessageContent? Content { get; private set; }
        private readonly List<MessageMultimedia> _medias = [];
        public IReadOnlyList<MessageMultimedia> Medias => _medias;

        private Message() { }
        public Message(int senderId, int receiverId, MessageContent? content, IEnumerable<MessageMultimedia>? images)
        {
            if (SenderId == receiverId)
                throw new SelfMessagingException();

            if (content == null && (images == null || !images.Any()))
                throw new MessageContentRequiredException();

            if (images != null && images.Count() > MaxNumberOfMessageImage)
                throw new TooManyMessageImagesException();

            SenderId = senderId;
            ReceiverId = receiverId;
            Content = content;
            if (images != null)
                _medias.AddRange(images);
        }
        public void Create()
        {
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
        public int State => _viewers.Count != 0 ? 2 : _receivers.Count != 0 ? 1 : 0;

        private readonly List<MessageUserRemove> _removers = [];
        public IReadOnlyList<MessageUserRemove> Removers => _removers;
        internal void Remove(int removerId)
        {
            if (removerId != ReceiverId && removerId != SenderId)
                throw new PermissionDeniedToRemoveMessageException();

            if (_removers.Any(x => x.UserId == removerId))
                return;

            _removers.Add(new(removerId));
        }
    }
}
