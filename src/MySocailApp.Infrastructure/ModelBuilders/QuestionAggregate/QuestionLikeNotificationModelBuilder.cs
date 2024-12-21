using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MySocailApp.Domain.QuestionDomain.QuestionAggregate.Entities;

namespace MySocailApp.Infrastructure.ModelBuilders.QuestionAggregate
{
    public class QuestionLikeNotificationModelBuilder : IEntityTypeConfiguration<QuestionUserLikeNotification>
    {
        public void Configure(EntityTypeBuilder<QuestionUserLikeNotification> builder)
        {
            builder.HasKey(x => new { x.QuestionId, x.AppUserId });
        }
    }
}
