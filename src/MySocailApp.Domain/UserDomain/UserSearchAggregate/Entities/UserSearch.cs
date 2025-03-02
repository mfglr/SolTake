using MySocailApp.Core;

namespace MySocailApp.Domain.UserDomain.UserSearchAggregate.Entities
{
    public class UserSearch : Entity, IAggregateRoot
    {
        public int SearcherId { get; private set; }
        public int SearchedId { get; private set; }

        private UserSearch(int searcherId, int searchedId)
        {
            SearcherId = searcherId;
            SearchedId = searchedId;
        }
        public static UserSearch Create(int searcherId, int searchedId) => new(searcherId, searchedId) { CreatedAt = DateTime.UtcNow };
    }
}
