using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MySocailApp.Domain.CommentAggregate.Entities;

namespace MySocailApp.Infrastructure.ModelBuilders.CommentAggregate
{
    public class CommentModelBuilder : IEntityTypeConfiguration<Comment>
    {
        public void Configure(EntityTypeBuilder<Comment> builder)
        {
            builder.OwnsOne(x => x.Content);

            builder
                .HasMany(x => x.Likes)
                .WithOne(x => x.Comment)
                .HasForeignKey(x => x.CommentId);

            builder
                .HasMany(x => x.Children)
                .WithOne(x => x.Parent)
                .HasForeignKey(x => x.ParentId);

            builder
                .HasMany(x => x.Tags)
                .WithOne(x => x.Comment)
                .HasForeignKey(x => x.CommentId);
        }
    }
}
