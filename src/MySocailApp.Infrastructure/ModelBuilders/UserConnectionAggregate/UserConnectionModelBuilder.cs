using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MySocailApp.Domain.MessageDomain.MessageConnectionAggregate.Entities;

namespace MySocailApp.Infrastructure.ModelBuilders.UserConnectionAggregate
{
    public class UserConnectionModelBuilder : IEntityTypeConfiguration<MessageConnection>
    {
        public void Configure(EntityTypeBuilder<MessageConnection> builder)
        {
            builder.Property(e => e.Id).ValueGeneratedNever();
        }
    }
}
