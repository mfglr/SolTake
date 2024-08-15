namespace MySocailApp.Domain.AppUserAggregate.Entities
{
    public class UserSearch
    {
        public int Id { get; private set; }
        public int SearcherId { get; private set; }
        public int SearchedId { get; private set; }
        public DateTime CreatedAt { get; private set; }

        private UserSearch(int searchedId) => SearchedId = searchedId;
        public static UserSearch Create(int searchedId) => new (searchedId){ CreatedAt = DateTime.UtcNow };

        public AppUser Searcher { get; }
        public AppUser Searched { get; }
    }
}
