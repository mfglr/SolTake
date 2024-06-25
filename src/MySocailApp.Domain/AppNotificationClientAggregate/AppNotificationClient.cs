namespace MySocailApp.Domain.AppNotificationClientAggregate
{
    public class AppNotificationClient(string id)
    {
        public string Id { get; private set; } = id;
        public string ConnectionId { get; private set; } = null!;
        public DateTime? ConnectedAt { get; private set; }
        public AppNotificationClientState State { get; private set; }

        public void Create() => State = AppNotificationClientState.Disconnected;

        public void Connect(string connectionId)
        {
            ConnectionId = connectionId;
            ConnectedAt = DateTime.UtcNow;
            State = AppNotificationClientState.Connected;
        }
        public void Disconnect() => State = AppNotificationClientState.Disconnected;
    }
}
