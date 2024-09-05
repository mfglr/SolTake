using MySocailApp.Core;
using MySocailApp.Domain.AppUserAggregate.Entities;

namespace MySocailApp.Domain.CommentAggregate.Entities
{
    public class CommentUserLike : Entity
    {
        public int CommentId { get; private set; }
        public int AppUserId { get; private set; }

        private CommentUserLike(int appUserId) =>AppUserId = appUserId;

        public static CommentUserLike Create(int appUserId) => new(appUserId) { CreatedAt = DateTime.UtcNow };

        // read only navigator property
        public Comment Comment { get; } = null!;
        public AppUser AppUser { get; } = null!;

        
    }
}
