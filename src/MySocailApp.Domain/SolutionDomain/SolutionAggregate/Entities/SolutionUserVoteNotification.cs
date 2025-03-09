namespace MySocailApp.Domain.SolutionDomain.SolutionAggregate.Entities
{
    public class SolutionUserVoteNotification(int userId)
    {
        public int SolutionId { get; private set; }
        public int UserId { get; private set; } = userId;
    }
}
