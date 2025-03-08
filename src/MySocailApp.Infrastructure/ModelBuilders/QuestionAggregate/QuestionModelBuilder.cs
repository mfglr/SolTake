using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MySocailApp.Domain.QuestionDomain.QuestionAggregate.Entities;

namespace MySocailApp.Infrastructure.ModelBuilders.QuestionAggregate
{
    public class QuestionModelBuilder : IEntityTypeConfiguration<Question>
    {
        public void Configure(EntityTypeBuilder<Question> builder)
        {
            builder.OwnsOne(x => x.Exam);
            builder.OwnsOne(x => x.Subject);
            builder.OwnsOne(x => x.Topic);
            builder.OwnsOne(x => x.Content);

            builder
                .HasMany(x => x.Medias)
                .WithOne()
                .HasForeignKey(x => x.QuestionId)
                .OnDelete(DeleteBehavior.Cascade);
        }
    }
}
