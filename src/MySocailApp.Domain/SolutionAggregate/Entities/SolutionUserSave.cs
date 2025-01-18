using MySocailApp.Core;

namespace MySocailApp.Domain.SolutionAggregate.Entities
{
    public class SolutionUserSave : Entity
    {
        public int SolutionId { get; private set; }
        public int UserId { get; private set; }

        private SolutionUserSave(int userId) => UserId = userId;
        public static SolutionUserSave Create(int userId) => new (userId) { CreatedAt = DateTime.UtcNow };
    }
}
