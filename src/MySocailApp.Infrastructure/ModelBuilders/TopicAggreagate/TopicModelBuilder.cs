using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MySocailApp.Domain.TopicAggregate.Entities;

namespace MySocailApp.Infrastructure.ModelBuilders.TopicAggreagate
{
    public class TopicModelBuilder : IEntityTypeConfiguration<Topic>
    {
        public void Configure(EntityTypeBuilder<Topic> builder)
        {
            builder
                .HasMany(x => x.Questions)
                .WithOne(x => x.Topic)
                .HasForeignKey(x => x.TopicId);
        }
    }
}
