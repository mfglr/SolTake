using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using SolTake.Domain.SubjectAggregate.Entities;

namespace SolTake.Infrastructure.ModelBuilders.SubjectAggregate
{
    public class SubjectModelBuilder : IEntityTypeConfiguration<Subject>
    {
        public void Configure(EntityTypeBuilder<Subject> builder)
        {
        }
    }
}
