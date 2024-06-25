using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MySocailApp.Domain.AppUserAggregate;

namespace MySocailApp.Infrastructure.ModelBuilders.UserAggregate
{
    public class BlockModelBuilders : IEntityTypeConfiguration<Block>
    {
        public void Configure(EntityTypeBuilder<Block> builder)
        {
            builder.HasKey(x => new { x.BlockerId, x.BlockedId });
        }
    }
}
