using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MySocailApp.Domain.QuestionCommentAggregate.Entities;

namespace MySocailApp.Infrastructure.ModelBuilders.QuestionCommentAggregate
{
    public class QuestionCommentModelBuilder : IEntityTypeConfiguration<QuestionComment>
    {
        public void Configure(EntityTypeBuilder<QuestionComment> builder)
        {
            builder.OwnsOne(x => x.Content);

            builder
                .HasMany(x => x.Likes)
                .WithOne(x => x.QuestionComment)
                .HasForeignKey(x => x.QuestionCommentId);
        }
    }
}
