using MySocailApp.Core;

namespace MySocailApp.Domain.MessageDomain.MessageConnectionAggregate.Entities
{
    public class MessageConnection(int id) : Entity(id), IAggregateRoot
    {
        public string? ConnectionId { get; private set; }
        public bool IsConnected { get; private set; }

        public void Connect(string connectionId)
        {
            ArgumentException.ThrowIfNullOrEmpty(connectionId);

            IsConnected = true;
            ConnectionId = connectionId;
        }
        public void Disconnect()
        {
            IsConnected = false;
            UpdatedAt = DateTime.UtcNow;
        }
    }
}
