using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using SolTake.Domain.ExamAggregate.Entitities;

namespace SolTake.Infrastructure.ModelBuilders.ExamAggregate
{
    public class ExamModelBuilder : IEntityTypeConfiguration<Exam>
    {
        public void Configure(EntityTypeBuilder<Exam> builder)
        {
            builder.OwnsOne(x => x.Initialism);
            builder.OwnsOne(x => x.Name);
        }
    }
}
