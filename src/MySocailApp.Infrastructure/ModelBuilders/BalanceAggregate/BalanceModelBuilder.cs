using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MySocailApp.Domain.BalanceAggregate.Entities;

namespace MySocailApp.Infrastructure.ModelBuilders.BalanceAggregate
{
    public class BalanceModelBuilder : IEntityTypeConfiguration<Balance>
    {
        public void Configure(EntityTypeBuilder<Balance> builder)
        {
            builder.Property(e => e.Id).ValueGeneratedNever();
            builder.OwnsOne(x => x.Credit);
        }
    }
}
