using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using SolTake.Domain.SubjectAggregate.Entities;

namespace MySocailApp.Infrastructure.ModelBuilders.SubjectAggregate
{
    public class SubjectTopicModelBuilder : IEntityTypeConfiguration<SubjectTopic>
    {
        public void Configure(EntityTypeBuilder<SubjectTopic> builder)
        {
            builder.HasKey(x => new { x.SubjectId, x.TopicId });
        }
    }
}
