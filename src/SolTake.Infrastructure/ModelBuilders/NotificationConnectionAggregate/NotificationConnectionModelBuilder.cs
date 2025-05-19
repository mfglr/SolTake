using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MySocailApp.Domain.NotificationDomain.NotificationConnectionAggregate.Entities;

namespace MySocailApp.Infrastructure.ModelBuilders.NotificationConnectionAggregate
{
    public class NotificationConnectionModelBuilder : IEntityTypeConfiguration<NotificationConnection>
    {
        public void Configure(EntityTypeBuilder<NotificationConnection> builder)
        {
            builder.Property(e => e.Id).ValueGeneratedNever();
        }
    }
}
