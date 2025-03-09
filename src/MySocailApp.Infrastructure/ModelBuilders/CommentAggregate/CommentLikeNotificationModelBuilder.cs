using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MySocailApp.Domain.CommentDomain.CommentAggregate.Entities;

namespace MySocailApp.Infrastructure.ModelBuilders.CommentAggregate
{
    public class CommentLikeNotificationModelBuilder : IEntityTypeConfiguration<CommentUserLikeNotification>
    {
        public void Configure(EntityTypeBuilder<CommentUserLikeNotification> builder)
        {
            builder.HasKey(x => new { x.CommentId, x.UserId });
        }
    }
}
