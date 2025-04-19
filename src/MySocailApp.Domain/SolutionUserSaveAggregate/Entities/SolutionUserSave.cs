using MySocailApp.Core;

namespace MySocailApp.Domain.SolutionUserSaveAggregate.Entities
{
    public class SolutionUserSave(int solutionId, int userId) : Entity, IAggregateRoot
    {
        public int SolutionId { get; private set; } = solutionId;
        public int UserId { get; private set; } = userId;

        internal void Create() => CreatedAt = DateTime.UtcNow;
    }
}
