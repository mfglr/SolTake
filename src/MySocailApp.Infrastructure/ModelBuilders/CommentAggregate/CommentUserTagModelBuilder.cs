using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MySocailApp.Domain.CommentAggregate.Entities;

namespace MySocailApp.Infrastructure.ModelBuilders.CommentAggregate
{
    public class CommentUserTagModelBuilder : IEntityTypeConfiguration<CommentUserTag>
    {
        public void Configure(EntityTypeBuilder<CommentUserTag> builder)
        {
            builder.HasKey(x => new { x.CommentId, x.AppUserId });
        }
    }
}
