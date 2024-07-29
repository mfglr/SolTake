using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MySocailApp.Domain.ExamAggregate.Entitities;

namespace MySocailApp.Infrastructure.ModelBuilders.ExamAggregate
{
    public class ExamModelBuilder : IEntityTypeConfiguration<Exam>
    {
        public void Configure(EntityTypeBuilder<Exam> builder)
        {
            builder
                .HasMany(x => x.Subjects)
                .WithOne(x => x.Exam)
                .HasForeignKey(x => x.ExamId);

            builder
                .HasMany(x => x.Quesitons)
                .WithOne(x => x.Exam)
                .HasForeignKey(x => x.ExamId)
                .OnDelete(DeleteBehavior.NoAction);
        }
    }
}
