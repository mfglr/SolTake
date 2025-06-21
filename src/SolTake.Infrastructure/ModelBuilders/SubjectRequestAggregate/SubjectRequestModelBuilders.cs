using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using SolTake.Domain.SubjectRequestAggregate.Entities;

namespace SolTake.Infrastructure.ModelBuilders.SubjectRequestAggregate
{
    public class SubjectRequestModelBuilders : IEntityTypeConfiguration<SubjectRequest>
    {
        public void Configure(EntityTypeBuilder<SubjectRequest> builder)
        {
            builder.OwnsOne(x => x.SubjectName);
        }
    }
}
