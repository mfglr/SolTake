using SolTake.Domain.MessageAggregate.Exceptions;
using SolTake.Core;
using SolTake.Domain.MessageAggregate.DomainEvents;
using SolTake.Domain.MessageAggregate.ValueObjects;

namespace SolTake.Domain.MessageAggregate.Entities
{
    public class Message : Entity, IAggregateRoot
    {
        public readonly static int MaxNumberOfMessageImage = 5;

        public bool IsEdited { get; private set; }
        public int SenderId { get; private set; }
        public int ReceiverId { get; private set; }
        public MessageContent? Content { get; private set; }

        private readonly List<Multimedia> _medias = [];
        public IReadOnlyList<Multimedia> Medias => _medias;

        private Message() { }
        public Message(int senderId, int receiverId, MessageContent? content, IEnumerable<Multimedia>? medias)
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
        internal void Create(Login login)
        {
            CreatedAt = DateTime.UtcNow;
            AddDomainEvent(new MessageCreatedDomainEvent(this, login));
        }

        public IEnumerable<int> UserIds => [SenderId, ReceiverId];

    }
}
