﻿using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MySocailApp.Domain.SolutionAggregate.Entities;

namespace MySocailApp.Infrastructure.ModelBuilders.SolutionAggregate
{
    public class SolutionModelBuilder : IEntityTypeConfiguration<Solution>
    {
        public void Configure(EntityTypeBuilder<Solution> builder)
        {
            builder.OwnsOne(x => x.Content);
            builder.OwnsOne(x => x.Video);

            builder
                .HasMany(x => x.Images)
                .WithOne()
                .HasForeignKey(x => x.SolutionId)
                .OnDelete(DeleteBehavior.Cascade);

            builder
                .HasMany(x => x.Votes)
                .WithOne()
                .HasForeignKey(x => x.SolutionId)
                .OnDelete(DeleteBehavior.Cascade);

            builder
                .HasMany(x => x.VoteNotifications)
                .WithOne()
                .HasForeignKey(x => x.SolutionId)
                .OnDelete(DeleteBehavior.Cascade);

            builder
                .HasMany(x => x.Savers)
                .WithOne()
                .HasForeignKey(x => x.SolutionId)
                .OnDelete(DeleteBehavior.Cascade);
        }
    }
}
