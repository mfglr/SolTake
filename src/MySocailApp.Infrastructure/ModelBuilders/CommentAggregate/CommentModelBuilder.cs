﻿using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MySocailApp.Domain.CommentAggregate.Entities;

namespace MySocailApp.Infrastructure.ModelBuilders.CommentAggregate
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
