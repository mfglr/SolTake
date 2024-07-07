using MySocailApp.Core;

namespace MySocailApp.Domain.AppUserAggregate
{
    public class Block : IRemovable
    {
        public int BlockerId { get; private set; }
        public AppUser Blocker { get; } = null!;
        public int BlockedId { get; private set; }
        public AppUser Blocked { get; } = null!;
        public DateTime CreatedAt { get; private set; }

        private Block(int blockerId, int blockedId)
        {
            BlockerId = blockerId;
            BlockedId = blockedId;
        }

        public static Block Create(int blockerId, int blockedId)
        {
            var block = new Block(blockerId, blockedId)
            {
                CreatedAt = DateTime.UtcNow
            };
            return block;
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
