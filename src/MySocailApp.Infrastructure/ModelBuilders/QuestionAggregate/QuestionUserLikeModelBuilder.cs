using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MySocailApp.Domain.QuestionAggregate;

namespace MySocailApp.Infrastructure.ModelBuilders.QuestionAggregate
{
    public class QuestionUserLikeModelBuilder : IEntityTypeConfiguration<QuestionUserLike>
    {
        public void Configure(EntityTypeBuilder<QuestionUserLike> builder)
        {
            builder.HasKey(x => new { x.QuestionId, x.AppUserId });
        }
    }
}
