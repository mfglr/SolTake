using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MySocailApp.Domain.SolutionAggregate.Entities;

namespace MySocailApp.Infrastructure.ModelBuilders.SolutionAggregate
{
    public class SolutionModelBuilder : IEntityTypeConfiguration<Solution>
    {
        public void Configure(EntityTypeBuilder<Solution> builder)
        {
            builder.OwnsOne(x => x.Content);
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
            builder.OwnsMany(x => x.Medias);
        }
    }
}
