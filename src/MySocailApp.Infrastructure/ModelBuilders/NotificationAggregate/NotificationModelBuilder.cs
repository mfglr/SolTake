using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MySocailApp.Domain.NotificationAggregate.Entities;

namespace MySocailApp.Infrastructure.ModelBuilders.NotificationAggregate
{
    public class NotificationModelBuilder : IEntityTypeConfiguration<Notification>
    {
        public void Configure(EntityTypeBuilder<Notification> builder)
        {
            builder
                .HasOne(x => x.Comment)
                .WithMany()
                .HasForeignKey(x => x.CommentId);
        }
    }
}
