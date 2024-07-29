using MySocailApp.Core;

namespace MySocailApp.Domain.AppUserAggregate.Entities
{
    public class FollowRequest : IRemovable
    {
        public int RequesterId { get; private set; }
        public AppUser Requester { get; } = null!;
        public int RequestedId { get; private set; }
        public AppUser Requested { get; } = null!;
        public DateTime CreatedAt { get; private set; }

        private FollowRequest(int requesterId, int requestedId)
        {
            RequesterId = requesterId;
            RequestedId = requestedId;
        }

        public static FollowRequest Create(int requesterId, int requestedId)
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
