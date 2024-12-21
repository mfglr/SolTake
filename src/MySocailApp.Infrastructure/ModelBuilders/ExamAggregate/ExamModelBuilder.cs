using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MySocailApp.Domain.QuestionDomain.ExamAggregate.Entitities;

namespace MySocailApp.Infrastructure.ModelBuilders.ExamAggregate
{
    public class ExamModelBuilder : IEntityTypeConfiguration<Exam>
    {
        public void Configure(EntityTypeBuilder<Exam> builder)
        {
        }
    }
}
