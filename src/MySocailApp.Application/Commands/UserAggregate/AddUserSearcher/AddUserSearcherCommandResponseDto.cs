namespace MySocailApp.Application.Commands.UserAggregate.AddUserSearcher
{
    public class AddUserSearcherCommandResponseDto
    {
        public int Id { get; private set; }
        public int SearcherId { get; private set; }
        public int SearchedId { get; private set; }
        public DateTime CreatedAt { get; private set; }

        private AddUserSearcherCommandResponseDto() { }
    }
}
