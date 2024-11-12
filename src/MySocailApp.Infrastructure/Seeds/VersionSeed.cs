using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace MySocailApp.Infrastructure.Seeds
{
    public class VersionSeed : IEntityTypeConfiguration<Domain.VersionAggregate.Entities.Version>
    {
        public void Configure(EntityTypeBuilder<Domain.VersionAggregate.Entities.Version> builder)
        {
            builder
                .HasData(
                    new { Id = 1, CreatedAt = new DateTime(638669937798156688), Code = 1, IsUpgradeRequired = true },
                    new { Id = 2, CreatedAt = new DateTime(638669937798156688), Code = 2, IsUpgradeRequired = true },
                    new { Id = 3, CreatedAt = new DateTime(638669937798156688), Code = 3, IsUpgradeRequired = true },
                    new { Id = 4, CreatedAt = new DateTime(638669937798156688), Code = 4, IsUpgradeRequired = true },
                    new { Id = 5, CreatedAt = new DateTime(638669937798156688), Code = 5, IsUpgradeRequired = true },
                    new { Id = 6, CreatedAt = new DateTime(638669937798156688), Code = 6, IsUpgradeRequired = true },
                    new { Id = 7, CreatedAt = new DateTime(638669937798156688), Code = 7, IsUpgradeRequired = true },
                    new { Id = 8, CreatedAt = new DateTime(638669937798156688), Code = 8, IsUpgradeRequired = true },
                    new { Id = 9, CreatedAt = new DateTime(638669937798156688), Code = 9, IsUpgradeRequired = true },
                    new { Id = 10, CreatedAt = new DateTime(638669937798156688), Code = 10, IsUpgradeRequired = true },
                    new { Id = 11, CreatedAt = new DateTime(638669937798156688), Code = 11, IsUpgradeRequired = true },
                    new { Id = 12, CreatedAt = new DateTime(638669937798156688), Code = 12, IsUpgradeRequired = true },
                    new { Id = 13, CreatedAt = new DateTime(638669937798156688), Code = 13, IsUpgradeRequired = true },
                    new { Id = 14, CreatedAt = new DateTime(638669937798156688), Code = 14, IsUpgradeRequired = true }
                );
        }
    }
}
