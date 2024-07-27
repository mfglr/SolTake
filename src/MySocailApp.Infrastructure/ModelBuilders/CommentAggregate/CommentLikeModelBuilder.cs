using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MySocailApp.Domain.CommentAggregate.Entities;

namespace MySocailApp.Infrastructure.ModelBuilders.CommentAggregate
{
    public class CommentLikeModelBuilder : IEntityTypeConfiguration<CommentUserLike>
    {
        public void Configure(EntityTypeBuilder<CommentUserLike> builder)
        {
            builder.HasKey(x => new { x.QuestionCommentId, x.AppUserId });
        }
    }
}
