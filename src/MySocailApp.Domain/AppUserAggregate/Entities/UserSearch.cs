using MySocailApp.Core;

namespace MySocailApp.Domain.AppUserAggregate.Entities
{
    public class UserSearch : Entity
    {
        public int SearcherId { get; private set; }
        public int SearchedId { get; private set; }

        private UserSearch(int searchedId) => SearchedId = searchedId;
        public static UserSearch Create(int searchedId) => new (searchedId){ CreatedAt = DateTime.UtcNow };

        public AppUser Searcher { get; } = null!;
        public AppUser Searched { get; } = null!;
    }
}
