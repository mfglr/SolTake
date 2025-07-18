﻿using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using SolTake.Domain.CommentAggregate.Entities;

namespace SolTake.Infrastructure.ModelBuilders.CommentAggregate
{
    public class CommentModelBuilder : IEntityTypeConfiguration<Comment>
    {
        public void Configure(EntityTypeBuilder<Comment> builder)
        {
            builder.OwnsOne(x => x.Content);

            builder.HasIndex(x => x.QuestionId);
            builder.HasIndex(x => x.SolutionId);
            builder.HasIndex(x => x.ParentId);
            builder.HasIndex(x => x.RepliedId);

            builder
                .HasMany(x => x.Tags)
                .WithOne()
                .OnDelete(DeleteBehavior.Cascade);
        }
    }
}
