using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MySocailApp.Domain.CommentAggregate.Entities;

namespace MySocailApp.Infrastructure.ModelBuilders.CommentAggregate
{
    public class CommentLikeNotificationModelBuilder : IEntityTypeConfiguration<CommentLikeNotification>
    {
        public void Configure(EntityTypeBuilder<CommentLikeNotification> builder)
        {
            builder.HasKey(x => new {x.CommentId,x.AppUserId});
        }
    }
}
