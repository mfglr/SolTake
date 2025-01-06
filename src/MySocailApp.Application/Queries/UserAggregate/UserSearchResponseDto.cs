namespace MySocailApp.Application.Queries.UserAggregate
{
    public class UserSearchResponseDto
    {
        public int Id { get; private set; }
        public int SearcherId { get; private set; }
        public int SearchedId { get; private set; }
        public DateTime CreatedAt { get; private set; }
        public UserResponseDto? Searcher { get; private set; }
        public UserResponseDto? Searched { get; private set; }

        public UserSearchResponseDto(int id, int searcherId, int searchedId, DateTime createdAt, UserResponseDto? searcher, UserResponseDto? searched)
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
