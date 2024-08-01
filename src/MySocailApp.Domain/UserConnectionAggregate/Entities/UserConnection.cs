using MySocailApp.Core;
using MySocailApp.Domain.AppUserAggregate.Entities;

namespace MySocailApp.Domain.UserConnectionAggregate.Entities
{
    public class UserConnection(int id) : IPaginableAggregateRoot
    {
        public int Id { get; private set; } = id;
        public string ConnectionId { get; private set; }
        public bool IsConnected { get; private set; }

        public void Connect(string connectionId)
        {
            ArgumentException.ThrowIfNullOrEmpty(connectionId);

            IsConnected = true;
            ConnectionId = connectionId;
        }
        public void Disconnect() => IsConnected = false;

        public AppUser AppUser { get; } = null!;
    }
}
