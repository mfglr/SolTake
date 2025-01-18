namespace MySocailApp.Application.Commands.SolutionAggregate.SaveSolution
{
    public class SaveSolutionCommandResponseDto
    {
        public int Id { get; private set; }
        public DateTime CreatedAt { get; private set; }
        public int SolutionId { get; private set; }
        public int UserId { get; private set; }

        private SaveSolutionCommandResponseDto() { }
    }
}
