using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using SolTake.Domain.TopicAggregate.Entities;

namespace MySocailApp.Infrastructure.ModelBuilders.TopicAggreagate
{
    public class TopicModelBuilder : IEntityTypeConfiguration<Topic>
    {
        public void Configure(EntityTypeBuilder<Topic> builder)
        {
        }
    }
}
