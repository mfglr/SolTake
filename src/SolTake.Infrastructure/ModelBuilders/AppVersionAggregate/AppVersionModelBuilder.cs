using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using SolTake.Domain.AppVersionAggregate.Entities;

namespace MySocailApp.Infrastructure.ModelBuilders.AppVersionAggregate
{
    public class AppVersionModelBuilder : IEntityTypeConfiguration<AppVersion>
    {
        public void Configure(EntityTypeBuilder<AppVersion> builder)
        {
            builder.OwnsOne(x => x.Code);
        }
    }
}
