using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MySocailApp.Domain.NotificationAggregate.Entities;

namespace MySocailApp.Infrastructure.ModelBuilders.NotificationAggregate
{
    public class NotificationModelBuilder : IEntityTypeConfiguration<Notification>
    {
        public void Configure(EntityTypeBuilder<Notification> builder)
        {
            builder.HasIndex(x => x.OwnerId);
            builder.HasIndex(x => x.AppUserId);
            builder.HasIndex(x => x.QuestionId);
            builder.HasIndex(x => x.SolutionId);
            builder.HasIndex(x => x.CommentId);
            builder.HasIndex(x => x.ParentId);
            builder.HasIndex(x => x.RepliedId);

        }
    }
}
