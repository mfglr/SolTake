using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MySocailApp.Domain.QuestionCommentAggregate.Entities;

namespace MySocailApp.Infrastructure.ModelBuilders.QuestionCommentAggregate
{
    public class QuestionCommentLikeModelBuilder : IEntityTypeConfiguration<QuestionCommentUserLike>
    {
        public void Configure(EntityTypeBuilder<QuestionCommentUserLike> builder)
        {
            builder.HasKey(x => new { x.QuestionCommentId, x.AppUserId });
        }
    }
}
