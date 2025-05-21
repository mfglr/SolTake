using SolTake.Core;

namespace SolTake.Domain.UserUserSearchAggregate.Entities
{
    public class UserUserSearch(int searcherId, int searchedId) : Entity, IAggregateRoot
    {
        public int SearcherId { get; private set; } = searcherId;
        public int SearchedId { get; private set; } = searchedId;

        internal void Create() => CreatedAt = DateTime.UtcNow;
    }
}
