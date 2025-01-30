using MySocailApp.Core;

namespace AccountDomain.AccountAggregate.Entities
{
    public class Block : IHasId
    {
        public int Id { get; private set; }
        public DateTime CreatedAt { get; private set; }
        public int BlockerId { get; private set; }
        public int BlockedId { get; private set; }

        private Block(int blockerId) => BlockerId = blockerId;

        public static Block Create(int blockerId) => new(blockerId) { CreatedAt = DateTime.UtcNow };
    }
}
