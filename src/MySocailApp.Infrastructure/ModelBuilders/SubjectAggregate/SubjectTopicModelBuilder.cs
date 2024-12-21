using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MySocailApp.Domain.QuestionDomain.SubjectAggregate.Entities;

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
