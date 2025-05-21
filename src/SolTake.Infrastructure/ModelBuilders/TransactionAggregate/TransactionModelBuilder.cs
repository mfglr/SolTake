using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using SolTake.Domain.TransactionAggregate.Entities;

namespace MySocailApp.Infrastructure.ModelBuilders.TransactionAggregate
{
    public class TransactionModelBuilder : IEntityTypeConfiguration<Transaction>
    {
        public void Configure(EntityTypeBuilder<Transaction> builder)
        {
        }
    }
}
