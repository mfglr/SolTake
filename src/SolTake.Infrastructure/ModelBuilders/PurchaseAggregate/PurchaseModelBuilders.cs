using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using SolTake.Domain.PurchaseAggregate.Entities;

namespace SolTake.Infrastructure.ModelBuilders.PurchaseAggregate
{
    public class PurchaseModelBuilders : IEntityTypeConfiguration<Purchase>
    {
        public void Configure(EntityTypeBuilder<Purchase> builder)
        {
            builder.HasIndex(x => x.Token);
        }
    }
}
