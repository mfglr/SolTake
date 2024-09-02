namespace MySocailApp.Application.Commands.UserAggregate.AddUserSearched
{
    public class AddUserSearchedCommandResponseDto
    {
        public int Id { get; private set; }
        public int SearcherId { get; private set; }
        public int SearchedId { get; private set; }
        public DateTime CreatedAt { get; private set; }

        private AddUserSearchedCommandResponseDto() { }
    }
}
