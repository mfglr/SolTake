namespace MySocailApp.Application.Commands.AccountAggregate.Block
{
    public class BlockCommandResponseDto
    {
        public int Id { get; private set; }
        public DateTime CreatedAt { get; private set; }
        public int BlockerId { get; private set; }
        public int BlockedId { get; private set; }

        private BlockCommandResponseDto() { }
    }
}
