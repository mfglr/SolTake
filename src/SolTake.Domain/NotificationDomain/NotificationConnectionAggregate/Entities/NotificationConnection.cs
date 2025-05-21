namespace SolTake.Domain.NotificationDomain.NotificationConnectionAggregate.Entities
{
    public class NotificationConnection(int id)
    {
        public int Id { get; private set; } = id;
        public bool IsConnected { get; private set; }
        public string? ConnectionId { get; private set; }

        public void Connect(string connectionId)
        {
            ConnectionId = connectionId;
            IsConnected = true;
        }
        public void Disconnect() => IsConnected = false;
    }
}
