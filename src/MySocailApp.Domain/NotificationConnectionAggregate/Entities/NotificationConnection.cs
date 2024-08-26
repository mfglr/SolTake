using MySocailApp.Domain.AppUserAggregate.Entities;

namespace MySocailApp.Domain.NotificationConnectionAggregate.Entities
{
    public class NotificationConnection
    {
        public int Id { get; private set; }
        public bool IsConnected { get; private set; }
        public string? ConnectionId { get; private set; }

        public NotificationConnection(int id) => Id = id;

        public void Connect(string connectionId)
        {
            ConnectionId = connectionId;
            IsConnected = true;
        }
        public void Disconnect() => IsConnected = false;

        public AppUser AppUser { get; } = null!;
    }
}
