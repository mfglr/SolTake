namespace MySocailApp.Application.Queries.UserAggregate
{
    public class UserSearchResponseDto
    {
        public int Id { get; private set; }
        public int SearcherId { get; private set; }
        public int SearchedId { get; private set; }
        public DateTime CreatedAt { get; private set; }
        public AppUserResponseDto? Searcher { get; private set; }
        public AppUserResponseDto? Searched { get; private set; }

        public UserSearchResponseDto(int id, int searcherId, int searchedId, DateTime createdAt, AppUserResponseDto? searcher, AppUserResponseDto? searched)
        {
            Id = id;
            SearcherId = searcherId;
            SearchedId = searchedId;
            CreatedAt = createdAt;
            Searcher = searcher;
            Searched = searched;
        }

        private UserSearchResponseDto() { }
    }
}
