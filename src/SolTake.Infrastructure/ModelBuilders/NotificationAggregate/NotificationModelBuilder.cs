using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using SolTake.Domain.NotificationDomain.NotificationAggregate.Entities;

namespace MySocailApp.Infrastructure.ModelBuilders.NotificationAggregate
{
    public class NotificationModelBuilder : IEntityTypeConfiguration<Notification>
    {
        public void Configure(EntityTypeBuilder<Notification> builder)
        {
            builder.OwnsOne(x => x.Image);
            builder.OwnsOne(x => x.QuestionMedia);
            builder.OwnsOne(x => x.SolutionMedia);
        }
    }
}
