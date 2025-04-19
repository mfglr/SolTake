using MySocailApp.Core;

namespace MySocailApp.Domain.UserUserSearchAggregate.Entities
{
    public class UserUserSearch : Entity, IAggregateRoot
    {
        public int SearcherId { get; private set; }
        public int SearchedId { get; private set; }

        private UserUserSearch(int searcherId, int searchedId)
        {
            SearcherId = searcherId;
            SearchedId = searchedId;
        }
        public static UserUserSearch Create(int searcherId, int searchedId)
            => new(searcherId, searchedId) { CreatedAt = DateTime.UtcNow };
    }
}
