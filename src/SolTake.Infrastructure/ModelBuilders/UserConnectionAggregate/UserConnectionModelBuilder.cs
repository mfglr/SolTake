using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using SolTake.Domain.MessageConnectionAggregate.Entities;

namespace SolTake.Infrastructure.ModelBuilders.UserConnectionAggregate
{
    public class UserConnectionModelBuilder : IEntityTypeConfiguration<MessageConnection>
    {
        public void Configure(EntityTypeBuilder<MessageConnection> builder)
        {
            builder.Property(e => e.Id).ValueGeneratedNever();
        }
    }
}
