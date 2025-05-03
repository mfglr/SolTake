using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MySocailApp.Domain.TransactionAggregate.Entities;

namespace MySocailApp.Infrastructure.ModelBuilders.TransactionAggregate
{
    public class TransactionModelBuilder : IEntityTypeConfiguration<Transaction>
    {
        public void Configure(EntityTypeBuilder<Transaction> builder)
        {
            builder.OwnsOne(
                s => s.Model,
                x => {
                    x.OwnsOne(
                        sam => sam.Input,
                        sam => sam.Property(x => x.Price).HasColumnType("decimal(18,9)")
                    );
                    x.OwnsOne(
                        sam => sam.Output,
                        sam => sam.Property(x => x.Price).HasColumnType("decimal(18,9)")
                    );
                });
        }
    }
}
