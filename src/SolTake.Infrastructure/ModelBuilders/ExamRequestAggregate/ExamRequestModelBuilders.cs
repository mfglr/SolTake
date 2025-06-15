using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using SolTake.Domain.ExamRequestAggregate.Entities;

namespace SolTake.Infrastructure.ModelBuilders.ExamRequestAggregate
{
    public class ExamRequestModelBuilders : IEntityTypeConfiguration<ExamRequest>
    {
        public void Configure(EntityTypeBuilder<ExamRequest> builder)
        {
            builder.OwnsOne(x => x.Initialism);
            builder.OwnsOne(x => x.Name);
        }
    }
}
