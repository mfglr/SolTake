using MySocailApp.Core;

namespace MySocailApp.Domain.SolutionDomain.SolutionUserSaveAggregate.Entities
{
    public class SolutionUserSave : Entity, IAggregateRoot
    {
        public int SolutionId { get; private set; }
        public int UserId { get; private set; }
        private SolutionUserSave(int solutionId, int userId)
        {
            SolutionId = solutionId;
            UserId = userId;
        }

        public static SolutionUserSave Create(int solutionId, int userId)
            => new(solutionId, userId) { CreatedAt = DateTime.UtcNow };
    }
}
