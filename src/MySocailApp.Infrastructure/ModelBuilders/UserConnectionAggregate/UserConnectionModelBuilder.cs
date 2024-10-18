using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MySocailApp.Domain.UserConnectionAggregate.Entities;

namespace MySocailApp.Infrastructure.ModelBuilders.UserConnectionAggregate
{
    public class UserConnectionModelBuilder : IEntityTypeConfiguration<UserConnection>
    {
        public void Configure(EntityTypeBuilder<UserConnection> builder)
        {
            builder.Property(e => e.Id).ValueGeneratedNever();
        }
    }
}
