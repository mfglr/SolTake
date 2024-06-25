using MySocailApp.Core;

namespace MySocailApp.Domain.AppUserAggregate
{
    public class FollowRequest : IRemovable
    {
        public string RequesterId { get; private set; }
        public AppUser Requester { get; } = null!;
        public string RequestedId { get; private set; }
        public AppUser Requested { get; } = null!;
        public DateTime CreatedAt { get; private set; }

        private FollowRequest(string requesterId, string requestedId)
        {
            RequesterId = requesterId;
            RequestedId = requestedId;
        }

        public static FollowRequest Create(string requesterId, string requestedId)
        {
            var request = new FollowRequest(requesterId, requestedId)
            {
                CreatedAt = DateTime.UtcNow
            };
            return request;
        }

        //IRemovable
        public bool IsRemoved { get; private set; }
        public DateTime? RemovedAt { get; private set; }
        public void Remove()
        {
            IsRemoved = true;
            RemovedAt = DateTime.UtcNow;
        }
        public void Restore()
        {
            IsRemoved = false;
            RemovedAt = null;
        }
    }
}
