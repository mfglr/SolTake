namespace MySocailApp.Domain.MessageAggregate.Entities
{
    public class MessageUserRemove
    {
        public int MessageId { get; private set; }
        public int UserId { get; private set; }

        private MessageUserRemove() { }
        public MessageUserRemove(int userId) => UserId = userId;
    }
}
