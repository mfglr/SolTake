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
        public void Create(string userName, Multimedia? image)
        {
            CreatedAt = DateTime.UtcNow;
            AddDomainEvent(new MessageCreatedDomainEvent(this,userName,image));
        }

        public IEnumerable<int> UserIds => [ SenderId, ReceiverId ];

        private readonly List<MessageUserView> _viewers = [];
        public IReadOnlyCollection<MessageUserView> Viewers => _viewers;
        
        public void MarkAsViewed(int viewerId)
        {
            if (viewerId != ReceiverId)
                throw new PermissionDeniedToChangeStateOfMessageException();
            if (_viewers.Any(x => x.UserId == viewerId))
                throw new MessageAlreadyMarkedAsViewedException();
            _viewers.Add(MessageUserView.Create(viewerId));
            AddDomainEvent(new MessageMarkedAsViewedDomainEvent(this));
        }
    }
}
