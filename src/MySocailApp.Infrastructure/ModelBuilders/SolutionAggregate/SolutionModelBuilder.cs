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

            builder
                .HasMany(x => x.Images)
                .WithOne(x => x.Solution)
                .HasForeignKey(x => x.SolutionId);

            builder
                .HasMany(x => x.Comments)
                .WithOne(x => x.Solution)
                .HasForeignKey(x => x.SolutionId);
        }
    }
}
