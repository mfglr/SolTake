using MySocailApp.Core;

namespace MySocailApp.Domain.AppUserAggregate.Entities
{
    public class UserSearch : IHasId
    {
        public int Id { get; private set; }
        public DateTime CreatedAt { get; private set; }
        public int SearcherId { get; private set; }
        public int SearchedId { get; private set; }

        private UserSearch(int searcherId) => SearcherId = searcherId;
        public static UserSearch Create(int searcherId) => new (searcherId) { CreatedAt = DateTime.UtcNow };
    }
}
