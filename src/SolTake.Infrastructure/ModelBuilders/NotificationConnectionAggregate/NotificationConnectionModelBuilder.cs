using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using SolTake.Domain.NotificationDomain.NotificationConnectionAggregate.Entities;

namespace SolTake.Infrastructure.ModelBuilders.NotificationConnectionAggregate
{
    public class NotificationConnectionModelBuilder : IEntityTypeConfiguration<NotificationConnection>
    {
        public void Configure(EntityTypeBuilder<NotificationConnection> builder)
        {
            builder.Property(e => e.Id).ValueGeneratedNever();
        }
    }
}
