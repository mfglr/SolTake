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
                .HasForeignKey(x => x.SolutionId)
                .OnDelete(DeleteBehavior.Cascade);

            builder
                .HasMany(x => x.Votes)
                .WithOne(x => x.Solution)
                .HasForeignKey(x => x.SolutionId)
                .OnDelete(DeleteBehavior.Cascade);

            builder
                .HasMany(x => x.VoteNotifications)
                .WithOne(x => x.Solution)
                .HasForeignKey(x => x.SolutionId)
                .OnDelete(DeleteBehavior.Cascade);

            builder
                .HasMany(x => x.Comments)
                .WithOne(x => x.Solution)
                .HasForeignKey(x => x.SolutionId)
                .OnDelete(DeleteBehavior.NoAction);

            builder
                .HasMany(x => x.Notifications)
                .WithOne(x => x.Solution)
                .HasForeignKey(x => x.SolutionId)
                .OnDelete(DeleteBehavior.NoAction);
        }
    }
}
