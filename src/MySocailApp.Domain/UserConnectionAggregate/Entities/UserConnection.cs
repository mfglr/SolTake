using MySocailApp.Core;
using MySocailApp.Domain.AppUserAggregate.Entities;

namespace MySocailApp.Domain.UserConnectionAggregate.Entities
{
    public class UserConnection(int id) : Entity(id), IAggregateRoot
    {
        public string? ConnectionId { get; private set; }
        public bool IsConnected { get; private set; }

        public void Connect(string connectionId)
        {
            ArgumentException.ThrowIfNullOrEmpty(connectionId);

            IsConnected = true;
            ConnectionId = connectionId;
        }
        public void Disconnect() => IsConnected = false;

        //readonly navigator properties
        public AppUser AppUser { get; } = null!;
    }
}
