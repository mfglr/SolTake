using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MySocailApp.Domain.QuestionDomain.TopicAggregate.Entities;

namespace MySocailApp.Infrastructure.ModelBuilders.TopicAggreagate
{
    public class TopicModelBuilder : IEntityTypeConfiguration<Topic>
    {
        public void Configure(EntityTypeBuilder<Topic> builder)
        {
        }
    }
}
