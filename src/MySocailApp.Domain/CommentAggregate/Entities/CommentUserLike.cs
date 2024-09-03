using MySocailApp.Core;
using MySocailApp.Domain.AppUserAggregate.Entities;

namespace MySocailApp.Domain.CommentAggregate.Entities
{
    public class CommentUserLike : Entity, IRemovable
    {
        public int CommentId { get; private set; }
        public int AppUserId { get; private set; }

        private CommentUserLike(int commentId, int appUserId)
        {
            CommentId = commentId;
            AppUserId = appUserId;
        }

        public static CommentUserLike Create(int questionCommentId, int appUserId)
            => new(questionCommentId, appUserId) { CreatedAt = DateTime.UtcNow };

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


        // read only navigator property
        public Comment Comment { get; } = null!;
        public AppUser AppUser { get; } = null!;

        
    }
}
