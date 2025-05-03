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
                    x.OwnsOne(sam => sam.Input);
                    x.OwnsOne(sam => sam.Output);
                });
            builder.OwnsMany(x => x.Medias);
        }
    }
}
