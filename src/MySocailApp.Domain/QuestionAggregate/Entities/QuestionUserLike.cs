using MySocailApp.Core;
using MySocailApp.Domain.AppUserAggregate.Entities;

namespace MySocailApp.Domain.QuestionAggregate.Entities
{
    public class QuestionUserLike : Entity,IRemovable
    {
        public int QuestionId { get; private set; }
        public int AppUserId { get; private set; }

        private QuestionUserLike(int appUserId) => AppUserId = appUserId;
        public static QuestionUserLike Create(int appUserId) => new(appUserId) { CreatedAt = DateTime.UtcNow };

        //IRemovable
        public bool IsRemoved { get; private set; }
        public DateTime? RemovedAt { get; private set; }
        public void Remove()
        {
            IsRemoved = true;
            RemovedAt = DateTime.UtcNow;
        }
        public void Restore()
        {
            IsRemoved = false;
            RemovedAt = null;
        }

        public Question Question { get; } = null!;
        public AppUser AppUser { get; } = null!;
    }
}
