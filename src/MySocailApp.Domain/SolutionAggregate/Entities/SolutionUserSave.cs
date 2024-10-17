using MySocailApp.Core;

namespace MySocailApp.Domain.SolutionAggregate.Entities
{
    public class SolutionUserSave : Entity
    {
        public int SolutionId { get; private set; }
        public int AppUserId { get; private set; }

        private SolutionUserSave(int appUserId) => AppUserId = appUserId;
        public static SolutionUserSave Create(int appUserId) => new (appUserId) { CreatedAt = DateTime.UtcNow };
    }
}
