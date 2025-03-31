using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MySocailApp.Domain.QuestionDomain.QuestionUserLikeNotificationAggregate.Entities;

namespace MySocailApp.Infrastructure.ModelBuilders.QuestionDomain
{
    public class QuestionUserLikeNotificationModelBuilder : IEntityTypeConfiguration<QuestionUserLikeNotification>
    {
        public void Configure(EntityTypeBuilder<QuestionUserLikeNotification> builder)
        {
            builder.HasKey(x => new { x.QuestionId, x.UserId });
        }
    }
}
