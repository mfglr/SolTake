namespace MySocailApp.Domain.SolutionAggregate.Entities
{
    public class SolutionUserVoteNotification(int appUserId)
    {
        public int SolutionId { get; private set; }
        public int AppUserId { get; private set; } = appUserId;
    }
}
