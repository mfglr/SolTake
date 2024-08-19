using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MySocailApp.Domain.QuestionAggregate.Entities;

namespace MySocailApp.Infrastructure.ModelBuilders.QuestionAggregate
{
    public class QuestionModelBuilder : IEntityTypeConfiguration<Question>
    {
        public void Configure(EntityTypeBuilder<Question> builder)
        {
            builder
                .HasMany(x => x.Notifications)
                .WithOne(x => x.Question)
                .HasForeignKey(x => x.QuestionId)
                .OnDelete(DeleteBehavior.NoAction);

            builder
                .HasMany(x => x.Images)
                .WithOne(x => x.Question)
                .HasForeignKey(x => x.QuestionId)
                .OnDelete(DeleteBehavior.NoAction);

            builder
                .HasMany(x => x.Topics)
                .WithOne(x => x.Question)
                .HasForeignKey(x => x.QuestionId)
                .OnDelete(DeleteBehavior.NoAction);

            builder
                .HasMany(x => x.Likes)
                .WithOne(x => x.Question)
                .HasForeignKey(x => x.QuestionId)
                .OnDelete(DeleteBehavior.NoAction);

            builder
                .HasMany(x => x.Solutions)
                .WithOne(x => x.Question)
                .HasForeignKey(x => x.QuestionId)
                .OnDelete(DeleteBehavior.NoAction);

            builder
                .HasMany(x => x.Comments)
                .WithOne(x => x.Question)
                .HasForeignKey(x => x.QuestionId)
                .OnDelete(DeleteBehavior.NoAction);
        }
    }
}
