using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MySocailApp.Domain.QuestionAggregate.Entities;

namespace MySocailApp.Infrastructure.ModelBuilders.QuestionAggregate
{
    public class QuestionLikeNotificationModelBuilder : IEntityTypeConfiguration<QuestionLikeNotification>
    {
        public void Configure(EntityTypeBuilder<QuestionLikeNotification> builder)
        {
            builder.HasKey(x => new { x.QuestionId, x.AppUserId });
        }
    }
}
