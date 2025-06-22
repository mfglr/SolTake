using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using SolTake.Domain.TopicRequestAggregate.Entities;

namespace SolTake.Infrastructure.ModelBuilders.TopicRequestAggregate
{
    public class TopicRequestModelBuilders : IEntityTypeConfiguration<TopicRequest>
    {
        public void Configure(EntityTypeBuilder<TopicRequest> builder)
        {
            builder.OwnsOne(x => x.Name);
        }
    }
}
