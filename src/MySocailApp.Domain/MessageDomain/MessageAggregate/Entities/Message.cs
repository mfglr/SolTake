using MySocailApp.Core;
using MySocailApp.Domain.MessageDomain.MessageAggregate.DomainEvents;
using MySocailApp.Domain.MessageDomain.MessageAggregate.Exceptions;
using MySocailApp.Domain.MessageDomain.MessageAggregate.ValueObjects;

namespace MySocailApp.Domain.MessageDomain.MessageAggregate.Entities
{
    public class Message : Entity, IAggregateRoot
    {
        public readonly static int MaxNumberOfMessageImage = 5;

        public bool IsEdited { get; private set; }
        public int SenderId { get; private set; }
        public int ReceiverId { get; private set; }
        public MessageContent? Content { get; private set; }
        
        private readonly List<MessageMultimedia> _medias = [];
        public IReadOnlyList<MessageMultimedia> Medias => _medias;

        private Message() { }
        public Message(int senderId, int receiverId, MessageContent? content, IEnumerable<MessageMultimedia>? medias)
        {
            if (SenderId == receiverId)
                throw new SelfMessagingException();

            if (content == null && (medias == null || !medias.Any()))
                throw new MessageContentRequiredException();

            if (medias != null && medias.Count() > MaxNumberOfMessageImage)
                throw new TooManyMessageMediasException();

            SenderId = senderId;
            ReceiverId = receiverId;
            Content = content;
            _medias.AddRange(medias ?? []);
        }
        public void Create()
        {
            CreatedAt = DateTime.UtcNow;
            AddDomainEvent(new MessageCreatedDomainEvent(this));
        }

        public IEnumerable<int> UserIds => [SenderId, ReceiverId];

        private readonly List<MessageUserReceive> _receivers = [];
        private readonly List<MessageUserView> _viewers = [];
        public IReadOnlyCollection<MessageUserView> Viewers => _viewers;
        public IReadOnlyCollection<MessageUserReceive> Receivers => _receivers;
        public void MarkAsReceived(int receiverId)
        {
            if (receiverId != ReceiverId)
                throw new PermissionDeniedToChangeStateOfMessageException();
            if (_receivers.Any(x => x.UserId == receiverId))
                throw new MessageAlreadyMarktedAsReceivedException();
            _receivers.Add(MessageUserReceive.Create(receiverId));
            AddDomainEvent(new MessageMarkedAsReceivedDomainEvent(this));
        }
        public void MarkAsViewed(int viewerId)
        {
            if (viewerId != ReceiverId)
                throw new PermissionDeniedToChangeStateOfMessageException();
            if (_viewers.Any(x => x.UserId == viewerId))
                throw new MessageAlreadyMarkedAsViewedException();
            _viewers.Add(MessageUserView.Create(viewerId));
            AddDomainEvent(new MessageMarkedAsViewedDomainEvent(this));
        }
        
        public MessageState State => 
            _viewers.Count != 0 
                ? MessageState.Viewed 
                : _receivers.Count != 0 
                    ? MessageState.Reached 
                    : MessageState.Created;
    }
}
