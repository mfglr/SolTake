using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MySocailApp.Domain.TransactionAggregate.Entities;

namespace MySocailApp.Infrastructure.ModelBuilders.TransactionAggregate
{
    public class TransactionModelBuilder : IEntityTypeConfiguration<Transaction>
    {
        public void Configure(EntityTypeBuilder<Transaction> builder)
        {
            builder.OwnsOne(x => x.Money,m => m.OwnsOne(c => c.Currency));
        }
    }
}
