using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MySocailApp.Domain.QuestionAggregate;

namespace MySocailApp.Infrastructure.ModelBuilders.QuestionAggregate
{
    public class QuestionModelBuilder : IEntityTypeConfiguration<Question>
    {
        public void Configure(EntityTypeBuilder<Question> builder)
        {
            builder
                .HasMany(x => x.Topics)
                .WithOne(x => x.Question)
                .HasForeignKey(x => x.QuestionId);

            builder
                .HasMany(x => x.Likes)
                .WithOne(x => x.Question)
                .HasForeignKey(x => x.QuestionId);
        }
    }
}
